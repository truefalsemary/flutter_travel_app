import 'package:flutter_travel_app/src/features/content/data/content_api_constants.dart';
import 'package:flutter_travel_app/src/mock_server/mock_content_service.dart';
import 'package:grpc/grpc.dart';

Future<void> main(List<String> args) async {
  final server = MockServer();
  server.start();
  print('Server listening...');
}

class MockServer {
  bool _isRunning = false;
  late Server _server;

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
      print('Mock server running on port ${_server.port}');
    } catch (e) {
      print('Error starting server: $e');
      await _server.serve(port: 0); // Use random port if default is busy
      _isRunning = true;
    }
  }

  Future<void> stop() async {
    await _server.shutdown();
    _isRunning = false;
    print('Mock server stopped');
  }
}
