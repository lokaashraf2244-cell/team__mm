import 'package:dartz/dartz.dart';

import 'package:mm_2/core/errors/failure.dart';
import 'package:mm_2/features/auth/domain/reposatories/auth_repo.dart';
import 'package:mm_2/features/auth/data/models/login_req.dart';
class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<Either<Failure, dynamic>> call(
      LoginRequest request,
      ) async {
    return await repository.login(request);
  }
}