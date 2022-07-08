import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree_layer_flutter/injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);
}

abstract class Env {
  static const prod = 'prod';
  static const dev = 'dev';
  static const test = 'test';
}
