import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/core/constants/image_strings.dart';
import 'package:myapp/core/services/api_client.dart';
import 'package:myapp/features/auth/data/datasources/remote/api_endpoint_urls.dart';

import '../../core/constants/text_strings.dart';

final sl = GetIt.instance;

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Or'),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(
              image: AssetImage(tGoogleLogoImage),
              width: 20.0,
            ),
            onPressed: () {
              final apiClient =
                  sl<ApiClient>(); // Obtenir l'instance d'ApiClient
              apiClient.postRequest(path: '/login', data: {
                "email": "agenc1@gmail.com",
                "password": "azertyuiop"
              },).then((response) {
                // Gérer la réponse
              }).catchError((error) {
                // Gérer les erreurs
              });
            },
            label: const Text(tSignInWithGoogle),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
              text: tAlreadyHaveAnAccount,
              style: Theme.of(context).textTheme.bodyLarge,
              children: const [
                TextSpan(
                  text: tSignUp,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
