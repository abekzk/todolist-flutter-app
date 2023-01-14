import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class CustomClient extends http.BaseClient {
  final _client = http.Client();
  final FirebaseAuth firebaseAuth;

  CustomClient({required this.firebaseAuth});

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    String token = await firebaseAuth.currentUser!.getIdToken(); // TODO: null処理
    request.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    return _client.send(request);
  }

  @override
  void close() {
    _client.close();
    super.close();
  }
}
