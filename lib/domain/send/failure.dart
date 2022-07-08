import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class SendFailure with _$SendFailure {
  const factory SendFailure.invalidSend() = InvalidSend;
}
