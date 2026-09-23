import 'package:dartz/dartz.dart';
import 'package:mm_2/features/auth/data/models/signup_req.dart';

import 'package:mm_2/core/errors/failure.dart';
import '../reposatories/auth_repo.dart';
import 'package:mm_2/features/auth/data/models/signup_req.dart';

class SignUp {
  final AuthRepository repository;

  SignUp(this.repository);

  Future<Either<Failure, dynamic>> call(
     SignupRequest request,
      ) async {
    return await repository.register(request);
  }
}