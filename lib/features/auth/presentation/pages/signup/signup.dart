import 'package:flutter/material.dart';
import 'package:myapp/core/constants/image_strings.dart';
import 'package:myapp/core/constants/text_strings.dart';
import 'package:myapp/features/shared/common_widgets/forms/form_header_widget.dart';

class SignUpSreen extends StatelessWidget {
  const SignUpSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child:  Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormHeaderWidget(
                  title: tSignUpTitle,
                  subTitle: tSignUpSubtitle,
                  image: tRegisterScreenImage,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child:  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text("fullname"),
                          
                            //hintText: tEmail,
                            prefixIcon: Icon(
                              Icons.person_outline_rounded,
                              color: Color.fromARGB(216, 24, 24, 161),
                              ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Color(0xFF111111)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Color(0xFF111111),
                                ),
                            )
                            //hintStyle: TextStyle(color: Color(0xFF111111)),
                          ),
                        )
                      ],
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
