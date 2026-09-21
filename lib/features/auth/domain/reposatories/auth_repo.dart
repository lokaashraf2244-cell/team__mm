import 'package:dartz/dartz.dart';

import 'package:mm_2/core/errors/failure.dart';

import 'package:mm_2/features/auth/data/models/login_req.dart';
import 'package:mm_2/features/auth/data/models/signup_req.dart';
import 'package:mm_2/features/auth/data/models/verify_req.dart';
import 'package:mm_2/features/auth/data/models/resend.dart';

abstract class AuthRepository {
  Future<Either<Failure, dynamic>> login(
      LoginRequest request,
      );

  Future<Either<Failure, dynamic>> register(
      SignupRequest request,
      );

  Future<Either<Failure, dynamic>> verifyEmail(
      VerifyEmailRequest request,
      );

  Future<Either<Failure, dynamic>> resendOtp(
      ResendOtpRequest request,
      );
}