import 'package:flutter/material.dart';
import 'package:myapp/core/constants/image_strings.dart';
import 'package:myapp/core/constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;
 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: const AssetImage(tRegisterScreenImage),
          height: size.height * 0.2,
        ),
        Text(tWelcomeTitle, style: Theme.of(context).textTheme.headlineLarge,),
        Text(tWelcomeSubtitle, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}