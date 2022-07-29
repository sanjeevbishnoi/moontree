import 'package:dartz/dartz.dart';
import 'package:moontree/domain/core/value_object.dart';
import 'package:moontree/domain/core/value_failures.dart';
import 'package:moontree/domain/blockchain/validators.dart';

enum Protocols {
  ravencoinTestnet,
  ravencoinMainnet,
  evrmoreTestnet,
  evrmoreMainnet,
  fiat,
  unknown,
}

class Protocol extends ValueObject<Protocols> {
  @override
  final Either<ValueFailure<Protocols>, Protocols> value;

  const Protocol._(this.value);

  factory Protocol(Protocols protocol) =>
      Protocol._(validateProtocol(protocol));
  factory Protocol.empty() => Protocol(Protocols.unknown);
}
