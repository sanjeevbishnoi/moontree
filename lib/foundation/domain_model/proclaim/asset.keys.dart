part of 'asset.dart';

// primary key - byId

class _IdKey extends Key<DomainAsset> {
  @override
  String getKey(DomainAsset address) => address.id;
}

extension ByIdMethodsForAsset on Index<_IdKey, DomainAsset> {
  DomainAsset? getOne(String symbol, Protocols protocol) =>
      getByKeyStr(DomainAsset.generateId(symbol, protocol)).firstOrNull;
}

// symbol

class _SymbolKey extends Key<DomainAsset> {
  @override
  String getKey(DomainAsset address) => address.symbol;
}

extension BySymbolMethodsForAsset on Index<_SymbolKey, DomainAsset> {
  List<DomainAsset> getAll(String symbol) => getByKeyStr(symbol);
}

// protocol

class _ProtocolKey extends Key<DomainAsset> {
  @override
  String getKey(DomainAsset address) => address.protocol.name;
}

extension ByProtocolMethodsForAsset on Index<_ProtocolKey, DomainAsset> {
  List<DomainAsset> getAll(Protocols protocol) => getByKeyStr(protocol.name);
}
