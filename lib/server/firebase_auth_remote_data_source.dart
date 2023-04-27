import 'package:http/http.dart' as http;

class FirebaseAuthRemoteDataSource {
  final String url =
      'https://asia-northeast3-yong-project-8b980.cloudfunctions.net/createCustomToken';

  Future<String> createCustomToken(Map<String, dynamic> user) async {
    print('user: $user');
    final customTokenResponse = await http.post(Uri.parse(url), body: user);

    // String token = await createCustomToken(user);
    // print('Token: $token');
    return customTokenResponse.body;
  }
}
