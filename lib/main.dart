import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/core/secrets/app_secret.dart';
import 'package:myapp/config/theme/theme_new.dart';
import 'package:myapp/curve_container_design2.dart';
import 'package:myapp/features/auth/data/datasources/remote/exemple_auth_remote_data_source.dart';
import 'package:myapp/features/auth/data/repository/auth_repository_impl.dart';
import 'package:myapp/features/auth/domain/usecases/user_sign_up.dart';
import 'package:myapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:myapp/settings/settings_page.dart';
import 'package:myapp/test_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: AppSecret.supabaseUrl,
    anonKey: AppSecret.supabaseAnonKey,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthBloc(
          userSignUp: UserSignUp(
            authRepository: AuthRepositoryImpl(
              remoteDataSource: AuthRemoteDataSourceImpl(
                supabase: supabase.client,
              ),
            ),
          ),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.system,
      home: const TestTheme(),
    );
  }
}
