import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:mobile_app/HomeScreen.dart';
import 'package:mobile_app/Token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FlutterAppAuth appAuth = const FlutterAppAuth();
  final String clientId = 'pkce-client';
  final String redirectUrl = 'com.example.mobileapp:/oauth2redirect';
  final String issuer = 'http://localhost:8080/realms/heyboonsong';
  final String discoveryUrl =
      'http://localhost:8080/realms/heyboonsong/.well-known/openid-configuration';
  final List<String> scopes = <String>[
    'openid',
    'profile',
    'email',
  ];

  @override
  void initState() {
    super.initState();
  }

  void gotoHomeScreen(Token token) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(token: token),
      ),
    );
  }

  Future<void> loginAction() async {
    try {
      final AuthorizationResponse? response = await appAuth.authorize(
        AuthorizationRequest(clientId, redirectUrl,
            discoveryUrl: discoveryUrl, scopes: scopes),
      );
      if (response != null) {
        final TokenResponse? tokenResponse = await appAuth.token(
          TokenRequest(clientId, redirectUrl,
              discoveryUrl: discoveryUrl,
              codeVerifier: response.codeVerifier,
              authorizationCode: response.authorizationCode),
        );
        if (tokenResponse != null) {
          Token token = Token(tokenResponse.idToken!,
              tokenResponse.accessToken!, tokenResponse.refreshToken!);
          gotoHomeScreen(token);
        }
      } else {
        print('Authorization error');
      }
    } catch (e) {
      print('Login error: $e');
    }
  }

  Future<TokenResponse?> getToken(
      String authorizationCode, String codeVerifier) {
    return appAuth.token(TokenRequest(clientId, redirectUrl,
        discoveryUrl: discoveryUrl,
        codeVerifier: codeVerifier,
        authorizationCode: authorizationCode));
  }

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
              loginAction();
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
}
