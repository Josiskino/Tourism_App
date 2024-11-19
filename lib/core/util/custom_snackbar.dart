import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/image_strings.dart';

void showCustomSnackBar(BuildContext context, String content) {
  final bool isAdding = content.startsWith('Added');
  final Color backgroundColor = isAdding ? Colors.green : Colors.red;
  final Color accentColor = isAdding ? Colors.green.shade800 : const Color(0xFF801336);

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Stack(
          clipBehavior: Clip.none,  
          children: [
            Container(
              height: 75, // Garde votre hauteur de 75 au lieu de 90
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 48),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isAdding ? 'Success!' : 'Removed!',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          content,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
                child: SvgPicture.asset(
                  tCustomSnackBarImage1,
                  height: 48,
                  width: 40,
                  color: accentColor,
                ),
              ),
            ),
            Positioned(
              top: -14, // Garde votre position -14 au lieu de -20
              left: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    tCustomSnackBarImage2,
                    height: 40,
                    color: accentColor, // Ajout de la couleur d'accent comme dans votre code
                  ),
                  Positioned(
                    top: 10,
                    child: SvgPicture.asset(
                      tCustomSnackBarImage3,
                      height: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: const Duration(seconds: 2), 
        animation: const AlwaysStoppedAnimation(1), 
      ),
    );
}