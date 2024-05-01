import 'package:flutter/material.dart';
import 'package:mobile_app/Token.dart';

class HomeScreen extends StatelessWidget {
  final Token token;
  const HomeScreen({super.key, required this.token});

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
            'Welcome to the Keycloak',
            style: TextStyle(
                fontSize: 28,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                decorationThickness: 0),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'ID Token: ${token.idToken}',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Access Token: ${token.accessToken}',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Refresh Token: ${token.refreshToken}',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              width: 200,
              child: const Text(
                'Logout',
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
