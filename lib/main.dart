import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm_2/core/cubit/theme/theme_state.dart';
import 'package:mm_2/core/cubit/theme/theme_cubit.dart';
import 'package:mm_2/core/router/app_router.dart';
import 'package:mm_2/injection_container.dart';
import 'package:mm_2/features/auth/presentation/cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),

        BlocProvider(
          create: (context) => getIt<AuthCubit>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.appRouter,

          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),

          themeMode: state.isDark
              ? ThemeMode.dark
              : ThemeMode.light,
        );
      },
    );
  }
}