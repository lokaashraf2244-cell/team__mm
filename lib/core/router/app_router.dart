import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:mm_2/injection_container.dart';

import 'package:mm_2/features/auth/presentation/screens/loginscreen.dart';
import 'package:mm_2/features/auth/presentation/screens/signupscreen.dart';
import 'package:mm_2/features/auth/presentation/screens/verification_screen.dart';

import 'package:mm_2/features/products/peresentation/screens/products_screen.dart';
import 'package:mm_2/features/products/peresentation/screens/product_details_screen.dart';

import 'package:mm_2/features/products/peresentation/cubit/product_cubit.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter appRouter = GoRouter(
    initialLocation: "/login",

    routes: [

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
          return const VerificationPage();
        },
      ),

      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => getIt<ProductCubit>(),
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
    ],
  );
}