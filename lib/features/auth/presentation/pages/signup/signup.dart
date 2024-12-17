import 'package:flutter/material.dart';
import 'package:myapp/core/constants/image_strings.dart';
import 'package:myapp/core/constants/text_strings.dart';
import 'package:myapp/features/shared/common_widgets/forms/form_header_widget.dart';

import '../login/login.dart';
import 'signup_form.dart';

class SignUpSreen extends StatelessWidget {
  const SignUpSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormHeaderWidget(
                  title: tSignUpTitle,
                  subTitle: tSignUpSubtitle,
                  image: tRegisterScreenImage,
                ),
                const SignUpFormWidget(),
                Column(
                  children: [
                    //const Text("OR"),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Image(
                          image: AssetImage(tGoogleLogoImage),
                          width: 20,
                        ),
                        label: const Text("Sign in with Google"),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Already Have An Account? ",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const TextSpan(text: "LOGIN"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
