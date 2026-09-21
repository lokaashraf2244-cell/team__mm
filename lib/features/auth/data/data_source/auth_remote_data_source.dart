import 'package:dartz/dartz.dart';
import '../models/login_req.dart';
import '../models/signup_req.dart';
import '../models/verify_req.dart';
import '../models/resend.dart';
import 'package:mm_2/core/errors/failure.dart';


abstract class AuthRemoteDataSource {
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