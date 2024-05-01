import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FlutterAppAuth appAuth = const FlutterAppAuth();
  final String _clientId = 'pkce-client';
  final String _issuer = 'http://localhost:8080/realms/heyboonsong';
  final String _redirectUrl = 'com.example.mobileapp:/oauth2redirect';

  final List<String> _scopes = <String>[
    'openid',
    'profile',
    'email',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Login to the Keycloak',
            style: TextStyle(
                fontSize: 28,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                decorationThickness: 0),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              login();
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              width: 200,
              child: const Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Future<void> login() async {
    // var issuer = await Issuer.discover(Uri.parse(_issuer));
    // var client = Client(issuer, _clientId);
    // urlLauncher(String url) async {
    //   Uri uri = Uri.parse(url);
    //   if (await launchUrl(uri)) {
    //   } else {
    //     throw 'Could not launch $url';
    //   }
    // }

    // var authenticator = Authenticator(
    //   client,
    //   urlLancher: urlLauncher,
    //   scopes: _scopes,
    //   redirectUri: Uri.parse(_redirectUrl),
    // );
    // var code = await authenticator.authorize();
    // print('code: $code');
    // await closeInAppWebView();

    final AuthorizationTokenResponse? result =
        await appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        _clientId,
        _redirectUrl,
        discoveryUrl: '$_issuer/.well-known/openid-configuration',
        scopes: [
          'openid',
          'profile',
          'email',
        ],
      ),
    );
    print(result);
  }
}
