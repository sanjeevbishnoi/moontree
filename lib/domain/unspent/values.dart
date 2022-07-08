import 'package:dartz/dartz.dart';
import 'package:moontree_layer_flutter/domain/core/value_object.dart';
import 'package:moontree_layer_flutter/domain/core/value_failures.dart';
import 'package:moontree_layer_flutter/domain/unspent/validators.dart';

class LockingScript extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const LockingScript._(this.value);

  factory LockingScript(String script) =>
      LockingScript._(validateLockingScript(script));
  factory LockingScript.empty() => LockingScript('');
}
