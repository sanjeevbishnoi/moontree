import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class UnspentFailure with _$UnspentFailure {
  const factory UnspentFailure.invalidUnspent() = InvalidUnspent;
}
