import 'package:dartz/dartz.dart';

import 'package:mm_2/core/errors/failure.dart';
import 'package:mm_2/features/domain/reposatories/auth_repo.dart';
import 'package:mm_2/features/auth/data/models/verify_req.dart';

class VerifyEmail {
  final AuthRepository repository;

  VerifyEmail(this.repository);

  Future<Either<Failure, dynamic>> call(
      VerifyEmailRequest request,
      ) async {
    return await repository.verifyEmail(request);
  }
}