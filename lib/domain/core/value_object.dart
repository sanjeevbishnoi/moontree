import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moontree_layer_flutter/domain/core/errors.dart';
import 'package:moontree_layer_flutter/domain/core/value_failures.dart';

@immutable
abstract class ValueObject<T> {
  Either<ValueFailure<T>, T> get value;

  const ValueObject();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ValueObject<T> && other.value == value);

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => '${this.runtimeType}($value)';

  bool get isValid => value.isRight();

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() => value.fold((l) => throw UnexpectedValueError(l), (r) => r);

  T? get() => value.fold((l) => null, (r) => r);
}
