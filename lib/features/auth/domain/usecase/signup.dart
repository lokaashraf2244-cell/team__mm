import 'package:dartz/dartz.dart';
import 'package:mm_2/features/auth/data/models/signup_req.dart';
import 'package:mm_2/core/errors/failure.dart';
import 'package:mm_2/features/auth/data/models/signup_req.dart';
import 'package:mm_2/features/auth/domain/reposatories/auth_repo.dart';

class SignUp {
  final AuthRepository repository;

  SignUp(this.repository);

  Future<Either<Failure, dynamic>> call(
     SignupRequest request,
      ) async {
    return await repository.register(request);
  }
}