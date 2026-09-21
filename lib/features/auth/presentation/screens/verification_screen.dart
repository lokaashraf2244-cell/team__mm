import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:go_router/go_router.dart';
class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 450,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  const SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Image.asset(
                      'Assets2/images/WhatsApp.jpeg',
                      fit: BoxFit.contain,
                    ),
                  ),


                  const SizedBox(height: 25),


                  Text(
                    'Verification',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),

                  const SizedBox(height: 12),


                  Text(
                    'Enter the verification code sent to your email',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 19,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Pinput(
                    controller: pinController,
                    length: 6,

                    defaultPinTheme: PinTheme(
                      width: 50,
                      height: 55,
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                      decoration: BoxDecoration(
                        color: theme.scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: theme.dividerColor,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ================= Verify Button =================
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        final otp = pinController.text;
                        context.push('/products');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Verify',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),


                  TextButton(
                    onPressed: () {

                    },
                    child: const Text(
                      'Resend Code',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
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