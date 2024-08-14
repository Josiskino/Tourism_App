import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:myapp/main_screen/bloc/cubit/activities_dropdown_cubit.dart';
import 'package:myapp/main_screen/bloc/cubit/map_cubit.dart';
import 'package:myapp/main_screen/bloc/cubit/tab_cubit.dart';
import 'package:myapp/main_screen/bloc/cubit/category_cubit.dart';
import 'package:myapp/init_dependancies.dart' as di;

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => di.sl<AuthBloc>(),
        ),
        BlocProvider<TabCubit>(
          create: (context) => di.sl<TabCubit>(),
        ),
        BlocProvider<MapCubit>(
          create: (context) => di.sl<MapCubit>(),
        ),
        BlocProvider<ActivitiesDropdownCubit>(
          create: (context) => di.sl<ActivitiesDropdownCubit>(),
        ),
        BlocProvider<CategoryCubit>(
          create: (context) => di.sl<CategoryCubit>(),
        ),
      ],
      child: child,
    );
  }
}
