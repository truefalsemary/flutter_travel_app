import 'package:logger/logger.dart';

enum LoggerFeature {
  auth,
  common,
  content;
}

enum LoggerLayers {
  data,
  domain,
  di,
  common,
  ui,
}

enum LoggerTypes {
  api,
  repository,
  screen,
  widget,
  bloc,
  server,
}

final class NamedLoggerFactory {
  const NamedLoggerFactory();

  Logger getLogger({
    required LoggerFeature feature,
    required LoggerLayers layer,
    required LoggerTypes type,
    String? name,
  }) {
    final loggerName = '[${feature.name}-${layer.name}-${type.name}]';
    if (name != null) {
      return Logger(printer: _NamedLoggerPrinter('$name:$loggerName'));
    }
    return Logger(printer: _NamedLoggerPrinter(loggerName));
  }
}

class _NamedLoggerPrinter extends PrettyPrinter {
  final String name;

  _NamedLoggerPrinter(this.name);

  @override
  // ignore: avoid_annotating_with_dynamic
  String stringifyMessage(dynamic message) {
    return '$name: $message';
  }
}
