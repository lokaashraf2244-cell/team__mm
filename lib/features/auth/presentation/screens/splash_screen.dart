import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mm_2/core/router/app_router.dart';
import '/core/constant/local_keys.dart';
import '/core/local_storage/base_local_storage.dart';
import 'package:mm_2/core/utils/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this._localStorage});

  final BaseLocalStorage _localStorage;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navigate() async {
    await widget._localStorage.clear();//تتشال يا مريم
    final bool? isOpen = await widget._localStorage.getBool(LocalKeys.isOpen);
    final String? token =
    await widget._localStorage.getString(LocalKeys.token);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOpen == null) {
        context.pushNamed('Onboarding');
      } else {
        if (token == null || token.isEmpty) {
          context.pushNamed('login');
        } else {
          context.pushNamed('home');
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    navigate();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(
          'Assets2/images/LOGO2.jpeg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }}