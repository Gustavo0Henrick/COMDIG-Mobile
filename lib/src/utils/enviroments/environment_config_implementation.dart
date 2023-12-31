import 'environment_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnviromentDEV implements EnvironmentConfig {
  static final EnviromentDEV _singleton = EnviromentDEV._internal();

  EnviromentDEV._internal();

  factory EnviromentDEV() {
    return _singleton;
  }

  @override
  String baseURL = dotenv.env['devURL'] ?? "";
}

class EnviromentHMG implements EnvironmentConfig {
  static final EnviromentHMG _singleton = EnviromentHMG._internal();

  EnviromentHMG._internal();

  factory EnviromentHMG() {
    return _singleton;
  }

  @override
  String baseURL = dotenv.env['hmgURL'] ?? "";
}

class EnviromentPROD implements EnvironmentConfig {
  static final EnviromentPROD _singleton = EnviromentPROD._internal();

  EnviromentPROD._internal();

  factory EnviromentPROD() {
    return _singleton;
  }

  @override
  String baseURL = dotenv.env['prodURL'] ?? "";
}
