import 'package:flutter_travel_app/src/common/utils/named_logger_factory.dart';
import 'package:flutter_travel_app/src/features/content/data/content_api_constants.dart';
import 'package:flutter_travel_app/src/mock_server/mock_content_service.dart';
import 'package:grpc/grpc.dart';
import 'package:logger/logger.dart';

Future<void> main(List<String> args) async {
  final logger = NamedLoggerFactory().getLogger(
    name: 'MockServer',
    feature: LoggerFeature.content,
    layer: LoggerLayers.data,
    type: LoggerTypes.server,
  );
  final server = MockServer(logger: logger);
  await server.start();
}

class MockServer {
  bool _isRunning = false;
  late Server _server;
  final Logger _logger;

  MockServer({required Logger logger}) : _logger = logger;

  Future<void> start() async {
    if (_isRunning) return;

    _server = Server.create(
      services: [MockRoutesContentService()],
      codecRegistry: CodecRegistry(
        codecs: const [
          GzipCodec(),
          IdentityCodec(),
        ],
      ),
    );

    try {
      await _server.serve(
        port: ContentApiConstants.port,
      );
      _isRunning = true;
      _logger.i('Mock server running on port ${_server.port}');
    } on Exception catch (e) {
      _logger.e('Error starting server: $e');
      _isRunning = false;
    }
  }
}
