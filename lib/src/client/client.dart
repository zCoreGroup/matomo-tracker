// coverage:ignore-file
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:matomo_tracker/src/client/pem.dart';

/// [DoDClient] for managing the http client for
/// mobile connect authentication
class DoDClient extends http.BaseClient {
  /// [DoDClient] Constructor
  DoDClient() {
    final clientContext = SecurityContext.defaultContext
      ..setTrustedCertificatesBytes(dodRootCA6PEM.codeUnits);
    final client = HttpClient(context: clientContext);
    _ioclient = IOClient(client);
  }

  var _ioclient = IOClient();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    return _ioclient.send(request);
  }
}
