import 'package:flutter/material.dart';
import 'package:myapp/core/util/screen_size.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget(
      {
        super.key,
        required this.title,
        required this.subTitle,
        required this.image,
      }
    );

  final String title, subTitle, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
        image: AssetImage(image), 
        height: SizeUtil.screenHeight * 0.2,
      ),
      Text(title, style: Theme.of(context).textTheme.headlineLarge,),
      Text(subTitle, style: Theme.of(context).textTheme.bodyLarge,),
      ],
    );
  }
}
