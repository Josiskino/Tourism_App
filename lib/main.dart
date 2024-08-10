import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/util/screen_size.dart';
import 'package:myapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:myapp/main_screen/bloc/cubit/activities_dropdown_cubit.dart';
import 'package:myapp/main_screen/bloc/cubit/map_cubit.dart';
import 'package:myapp/main_screen/bloc/cubit/tab_cubit.dart';
import 'package:myapp/main_screen/main_screen.dart';
import 'package:myapp/init_dependancies.dart' as di;
import 'package:myapp/config/theme/theme_new.dart';
import 'package:flutter/services.dart';
import 'package:myapp/main_screen/bloc/cubit/category_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure the status bar color and icons
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      //statusBarColor: Color(0xFF111111),
      statusBarColor: Color(0xFFFF6600),
      statusBarIconBrightness: Brightness.light,
    ),
  );

  await di.initDependancies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeUtil.init(context);

            return MultiBlocProvider(
              providers: [
                BlocProvider<AuthBloc>(
                  create: (context) => di.sl<AuthBloc>(),
                ),
                BlocProvider<TabCubit>(
                  create: (context) => TabCubit(),
                ),
                BlocProvider<MapCubit>(
                  create: (context) => MapCubit(),
                ),
                BlocProvider<ActivitiesDropdownCubit>(
                  create: (context) => ActivitiesDropdownCubit(),
                ),
                 BlocProvider<CategoryCubit>( 
                  create: (context) => CategoryCubit(),
                ),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightThemeData(context),
                darkTheme: darkThemeData(context),
                themeMode: ThemeMode.system,
                home: MainScreen(),
              ),
            );
          },
        );
      },
    );
  }
}