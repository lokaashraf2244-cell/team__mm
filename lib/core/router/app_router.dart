import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mm_2/injection_container.dart';
import 'package:mm_2/core/layout/main_layout.dart';
import 'package:mm_2/features/auth/presentation/screens/loginscreen.dart';
import 'package:mm_2/features/auth/presentation/screens/signupscreen.dart';
import 'package:mm_2/features/auth/presentation/screens/verification_screen.dart';
import 'package:mm_2/features/products/peresentation/screens/products_screen.dart';
import 'package:mm_2/features/auth/presentation/screens/settings_screen.dart';
import 'package:mm_2/features/products/peresentation/screens/products_screen.dart';
import 'package:mm_2/features/products/peresentation/screens/product_details_screen.dart';
import 'package:mm_2/features/products/peresentation/cubit/product_cubit.dart';
import 'package:mm_2/features/auth/presentation/screens/splash_screen.dart';
import 'package:mm_2/features/categories/presentation/cubit/categories_cubit.dart';
import '../../features/auth/presentation/screens/on_boarding_screen.dart';
import '../../features/cart/presentation/cubit/cart_cubit.dart';
import '../../features/cart/presentation/screens/cart_screen.dart';
final navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter appRouter = GoRouter(
    initialLocation: "/",

    routes: [

      GoRoute(
        path: "/",
        name: "splashScreen",
        builder: (context, state) {
          return SplashScreen(
            localStorage: getIt(),
          );
        },
      ),


      GoRoute(
        path: "/Onboarding",
        name: "Onboarding",
        builder: (context, state) {
          return OnboardingScreen(
            localStorage: getIt(),
          );
        },
      ),


      GoRoute(
        path: "/login",
        name: "login",
        builder: (context, state) {
          return const loginscreen();
        },
      ),

      GoRoute(
        path: "/sign-up",
        name: "signUp",
        builder: (context, state) {
          return const SignUpScreen();
        },
      ),

      GoRoute(
        path: "/verification",
        name: "verification",
        builder: (context, state) {
          final email =
              state.uri.queryParameters['email'] ?? '';

          print(
            'ROUTER RECEIVED EMAIL: $email',
          );

          return VerificationPage(
            email: email,
          );
        },
      ),

      ShellRoute(
        builder: (context, state, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<ProductCubit>(
                create: (_) =>
                    getIt<ProductCubit>(),
              ),

              BlocProvider<CategoriesCubit>(
                create: (_) =>
                    getIt<CategoriesCubit>(),
              ),

              BlocProvider<CartCubit>(
                create: (_) =>
                    getIt<CartCubit>(),
              ),
            ],
            child: child,
          );
        },

        routes: [
          GoRoute(
            path: "/products",
            name: "products",
            builder: (context, state) {
              return const ProductsScreen();
            },
          ),

          GoRoute(
            path: "/product-details",
            name: "productDetails",
            builder: (context, state) {
              final String? id =
              state.uri.queryParameters['id'];

              return ProductDetailsScreen(
                productId: id ?? "",
              );
            },
          ),


        ],
      ),
StatefulShellRoute.indexedStack(
builder: (context, state, navigationShell) {
  return MainLayout(
    navigationShell: navigationShell,
  );
},

branches: [
StatefulShellBranch(
routes: [
GoRoute(
path: '/home',
name: 'home',
builder: (context, state) {
return const ProductsScreen();
},
),
],
),


  StatefulShellBranch(
    routes: [
      GoRoute(
        path: '/cart',
        name: 'cart',
        builder: (context, state) {
          return BlocProvider(
            create: (_) => getIt<CartCubit>(),
            child: const CartScreen(),
          );
        },
      ),
    ],
  ),

StatefulShellBranch(
routes: [
GoRoute(
path: '/setting',
name: 'setting',
builder: (context, state) {
return const SettingsScreen();
},
),
],
),
], ) ]
);}

