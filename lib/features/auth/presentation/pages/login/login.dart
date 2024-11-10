import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/util/show_snackbar.dart';
import 'package:myapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:myapp/main_screen/main_screen.dart';

import 'widgets/login_footer_widget.dart';
import 'widgets/login_form_widget.dart';
import 'widgets/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(  
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              showSnackBar(context, state.message);
            } else if (state is AuthSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  MainScreen()),
              );
            }
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginHeaderWidget(size: size),
                  LoginForm(),
                  const LoginFooterWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
