const accountNumber = '0';
const ravencoinNumber = '44';

String getDerivationPath(
  int index, {
  bool mainnet = true,
  bool receive = true,
}) =>
    "m/"
    "$ravencoinNumber'/"
    "${mainnetNumber(mainnet)}'/"
    "$accountNumber'/"
    "${receiveNumber(receive)}/"
    "$index";

String receiveNumber([bool receive = true]) => receive ? '0' : '1';
String mainnetNumber([bool mainnet = true]) => mainnet ? '175' : '1';
