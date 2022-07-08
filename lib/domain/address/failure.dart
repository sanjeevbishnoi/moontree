import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class AddressFailure with _$AddressFailure {
  const factory AddressFailure.invalidAddress() = InvalidAddress;
}
