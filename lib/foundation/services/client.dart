import 'dart:async';

import 'package:moontree_client/moontree_client.dart';

/// singleton to hold connection object
class ClientConnection {
  Client client = Client('http://localhost:8080/');

  ClientConnection() {
    connect().then((_) => watch());
  }

  Client call() => client;

  Future<void> connect() async => await client.connectWebSocket();

  Future<void> maybeReconnect() async =>
      client.isWebSocketConnected ? null : await connect();

  void watch() => client.addWebSocketConnectionStatusListener(maybeReconnect);

  //Future<void> listen() async => await for (var message in client.myEndpoint.stream) {
  //  _handleMessage(message);
  //}

  //void send(String text) => client.myEndpoint.sendStreamMessage(MyMessage(text: 'Hello'));
}
