import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:mm_2/injection_container.dart';
import 'package:mm_2/features/auth/data/models/signup_req.dart';
import 'package:mm_2/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:mm_2/features/auth/presentation/cubit/auth_state.dart';
import 'package:mm_2/features/auth/presentation/widgets/custom_text_filed_widget.dart';

import 'loginscreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final TextEditingController firstNameController =
  TextEditingController();
  final TextEditingController lastNameController =
  TextEditingController();

  final formKey = GlobalKey<FormState>();

  final RegExp emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  final RegExp passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$',
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.push('/verification');
          }

          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: Builder(
          builder: (context) {
            return Scaffold(

              backgroundColor: Theme
                  .of(context)
                  .scaffoldBackgroundColor,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 240,
                        child: Image.asset(
                          'Assets2/images/signupimage.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: 25),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Text(
                          "Let's Connect with Us!",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color:
                            Theme
                                .of(context)
                                .textTheme
                                .bodyLarge
                                ?.color,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: firstNameController,
                                hintText: 'First Name',
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null ||
                                      value
                                          .trim()
                                          .isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(height: 15),

                              CustomTextField(
                                controller: lastNameController,
                                hintText: 'Last Name',
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null ||
                                      value
                                          .trim()
                                          .isEmpty) {
                                    return 'Please enter your last name';
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(height: 15),

                              CustomTextField(
                                controller: emailcontroller,
                                hintText: 'Email Address',
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }

                                  if (!emailRegex.hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }

                                  return null;
                                },
                              ),

                              const SizedBox(height: 15),

                              CustomTextField(
                                controller: passcontroller,
                                hintText: 'Password',
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }

                                  if (!passwordRegex.hasMatch(value)) {
                                    return 'Password must contain 8+ characters, uppercase, lowercase, number and special character';
                                  }

                                  return null;
                                },
                              ),

                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot password?',
                                    style: TextStyle(
                                      color: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.color,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ElevatedButton(
                                  onPressed: () {
                                    print(
                                        '========== SIGN UP PRESSED ==========');

                                    if (formKey.currentState!.validate()) {
                                      print('========== FORM VALID ==========');

                                      final request = SignupRequest(
                                        firstName: firstNameController.text
                                            .trim(),
                                        lastName: lastNameController.text
                                            .trim(),
                                        email: emailcontroller.text.trim(),
                                        password: passcontroller.text,
                                      );

                                      print(
                                          '========== CALLING REGISTER ==========');

                                      context.read<AuthCubit>().register(
                                          request);
                                    } else {
                                      print(
                                          '========== FORM INVALID ==========');
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.color,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color:
                                      Theme
                                          .of(context)
                                          .dividerColor,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      'or',
                                      style: TextStyle(
                                        color: Theme
                                            .of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.color,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color:
                                      Theme
                                          .of(context)
                                          .dividerColor,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),

                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.apple,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  label: const Text(
                                    'Sign up with Apple',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 14),

                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: const Text(
                                    'G',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  label: const Text(
                                    'Sign up with Google',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    side: const BorderSide(
                                      color: Color(0xffdddddd),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontSize: 13,
                              color: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.color,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}