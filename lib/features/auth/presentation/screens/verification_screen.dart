import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import 'package:mm_2/features/auth/data/models/verify_req.dart';
import 'package:mm_2/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:mm_2/features/auth/presentation/cubit/auth_state.dart';

class VerificationPage extends StatefulWidget {
  final String email;

  const VerificationPage({
    super.key,
    required this.email,
  });

  @override
  State<VerificationPage> createState() =>
      _VerificationPageState();
}

class _VerificationPageState
    extends State<VerificationPage> {

  final TextEditingController pinController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {

        if (state is AuthSuccess) {

          print('VERIFY SUCCESS');

          ScaffoldMessenger.of(context)
              .showSnackBar(
            const SnackBar(
              content: Text(
                'Email verified successfully',
              ),
            ),
          );
          context.go('/products');
        }
        if (state is AuthFailure) {

          print(
            'VERIFY FAILED: ${state.message}',
          );

          ScaffoldMessenger.of(context)
              .showSnackBar(
            SnackBar(
              content: Text(
                state.message,
              ),
            ),
          );
        }
      },

      child: Scaffold(
        backgroundColor:
        theme.scaffoldBackgroundColor,

        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Container(

                width: 450,

                padding:
                const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: theme.cardColor,

                  borderRadius:
                  BorderRadius.circular(20),
                ),

                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.center,

                  children: [

                    const SizedBox(height: 10),

                    SizedBox(
                      width:
                      double.infinity,

                      height: 300,

                      child: Image.asset(
                        'Assets2/images/signupimage.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 25),


                    Text(
                      'Verification',

                      style: TextStyle(
                        fontSize: 27,

                        fontWeight:
                        FontWeight.bold,

                        color: theme
                            .textTheme
                            .bodyLarge
                            ?.color,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Enter the verification code sent to your email',

                      textAlign:
                      TextAlign.center,

                      style: TextStyle(
                        fontSize: 19,

                        color: theme
                            .textTheme
                            .bodyMedium
                            ?.color,
                      ),
                    ),

                    const SizedBox(height: 30),

                    Pinput(
                      controller:
                      pinController,

                      length: 6,

                      defaultPinTheme:
                      PinTheme(

                        width: 50,

                        height: 55,

                        textStyle: TextStyle(
                          fontSize: 20,

                          fontWeight:
                          FontWeight.bold,

                          color: theme
                              .textTheme
                              .bodyLarge
                              ?.color,
                        ),

                        decoration:
                        BoxDecoration(

                          color: theme
                              .scaffoldBackgroundColor,

                          borderRadius:
                          BorderRadius.circular(
                            10,
                          ),

                          border: Border.all(
                            color:
                            theme.dividerColor,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    BlocBuilder<AuthCubit, AuthState>(
                      builder:
                          (context, state) {

                        final isLoading =
                        state is AuthLoading;

                        return SizedBox(
                          width:
                          double.infinity,

                          height: 50,

                          child:
                          ElevatedButton(

                            onPressed:
                            isLoading
                                ? null
                                : () {



                              final otp =
                              pinController
                                  .text
                                  .trim();

                              if (otp.length !=
                                  6) {

                                ScaffoldMessenger
                                    .of(context)
                                    .showSnackBar(
                                  const SnackBar(
                                    content:
                                    Text(
                                      'Please enter the 6-digit code',
                                    ),
                                  ),
                                );

                                return;
                              }

                              print(
                                '================ VERIFY DEBUG ================',
                              );

                              print(
                                'EMAIL: ${widget.email}',
                              );

                              print(
                                'OTP: $otp',
                              );

                              print(
                                '================================================',
                              );

                              final request =
                              VerifyEmailRequest(
                                email:
                                widget.email,

                                otp: otp,
                              );

                              context
                                  .read<
                                  AuthCubit>()
                                  .verify(
                                request,
                              );
                            },

                            style:
                            ElevatedButton
                                .styleFrom(

                              backgroundColor: const Color(0xFF0B1F3A),

                              foregroundColor:
                              Colors.white,

                              disabledBackgroundColor:
                              Colors.blue
                                  .withOpacity(
                                0.5,
                              ),

                              shape:
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),

                            child: isLoading
                                ? const SizedBox(
                              width: 24,

                              height: 24,

                              child:
                              CircularProgressIndicator(
                                color:
                                Colors.white,

                                strokeWidth:
                                2,
                              ),
                            )
                                : const Text(
                              'Verify',

                              style:
                              TextStyle(
                                fontSize:
                                19,

                                fontWeight:
                                FontWeight
                                    .bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 15),

                    TextButton(
                      onPressed: () {},

                      child: const Text(
                        'Resend Code',

                        style: TextStyle(
                          color:  Color(0xFF0B1F3A),

                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    pinController.dispose();

    super.dispose();
  }
}