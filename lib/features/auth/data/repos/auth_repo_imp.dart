import 'package:dartz/dartz.dart';

import 'package:mm_2/core/errors/failure.dart';

import 'package:mm_2/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:mm_2/features/auth/data/models/login_req.dart';
import 'package:mm_2/features/auth/data/models/signup_req.dart';
import 'package:mm_2/features/auth/data/models/verify_req.dart';
import 'package:mm_2/features/auth/data/models/resend.dart';
import 'package:mm_2/features/auth/domain/reposatories/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, dynamic>> login(
      LoginRequest request,
      ) async {
    return await remoteDataSource.login(request);
  }
  @override
  Future<Either<Failure, dynamic>> register(
      SignupRequest request,
      ) async {
    return await remoteDataSource.register(request);
  }

  @override
  Future<Either<Failure, dynamic>> verifyEmail(
      VerifyEmailRequest request,
      ) async {
    return await remoteDataSource.verifyEmail(request);
  }

  @override
  Future<Either<Failure, dynamic>> resendOtp(
      ResendOtpRequest request,
      ) async {
    return await remoteDataSource.resendOtp(request);
  }
}