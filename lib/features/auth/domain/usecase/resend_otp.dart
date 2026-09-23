import 'package:dartz/dartz.dart';
import 'package:mm_2/core/errors/failure.dart';
import '../reposatories/auth_repo.dart';
import 'package:mm_2/features/auth/data/models/resend.dart';

class ResendOtp {
  final AuthRepository repository;

  ResendOtp(this.repository);

  Future<Either<Failure, dynamic>> call(
      ResendOtpRequest request,
      ) async {
    return await repository.resendOtp(request);
  }
}