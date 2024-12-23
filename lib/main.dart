import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/util/screen_size.dart';
import 'package:myapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:myapp/init_dependancies.dart';
import 'package:myapp/main_screen/bloc/cubit/activities_dropdown_cubit.dart';
import 'package:myapp/main_screen/bloc/cubit/map_cubit.dart';
import 'package:myapp/main_screen/bloc/cubit/tab_cubit.dart';
import 'package:myapp/init_dependancies.dart' as di;
import 'package:myapp/config/theme/theme_new.dart';
import 'package:myapp/main_screen/bloc/cubit/category_cubit.dart';

import 'features/auth/presentation/pages/login/login.dart';
import 'features/home_page/presentation/bloc/home_page_bloc.dart';
import 'features/reservation/presentation/bloc/reservation_page_bloc.dart';
import 'features/transactions/presentation/bloc/transaction_page_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure the status bar color and icons
  //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     //statusBarColor: Color(0xFF111111),
  //     statusBarColor: Color(0xFFFF6600),
  //     statusBarIconBrightness: Brightness.light,
  //   ),
  // );

  await di.initDependencies();

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
                  create: (context) => di.serviceLocator<AuthBloc>(),
                ),
                BlocProvider<HomePageBloc>(
                  create: (context) => serviceLocator<HomePageBloc>(),
                ),
                BlocProvider<AuthBloc>(
                  create: (context) => serviceLocator<AuthBloc>(),
                ),
                BlocProvider<ReservationBloc>(
                  create: (context) => serviceLocator<ReservationBloc>(),
                ),
                BlocProvider<TransactionBloc>(
                  create: (context) => serviceLocator<TransactionBloc>(),
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
                //darkTheme: darkThemeData(context),
                themeMode: ThemeMode.system,
                //home: const Calendar(),
                //home: MainScreen(),
                //home: const SignUpSreen(),
                home: const LoginScreen(),
                //home: const NewHome(),
                //home: CustomBottomNavBar()

                //home: OnboardScreen(),
                //home: const TripScreen(),
                //home: ProfilScreen(),
              ),
            );
          },
        );
      },
    );
  }
}
