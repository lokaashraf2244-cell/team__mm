import 'package:dartz/dartz.dart';
import 'package:mm_2/core/errors/failure.dart';
import 'package:mm_2/core/network/api_constants.dart';
import 'package:mm_2/core/network/api_consumer.dart';
import '../models/login_req.dart';
import '../models/signup_req.dart';
import '../models/verify_req.dart';
import '../models/resend.dart';
import 'auth_remote_data_source.dart';

class AuthDataSourceImpl implements AuthRemoteDataSource {
  final ApiConsumer apiConsumer;

  AuthDataSourceImpl(this.apiConsumer);

  @override
  Future<Either<Failure, dynamic>> login(
      LoginRequest request,
      ) async {
    final response = await apiConsumer.post(
      path: ApiConstants.login,
      data: {
        'email': request.email,
        'password': request.password,
      },
    );


    return response;
  }

  @override
  Future<Either<Failure, dynamic>> register(SignupRequest request) async {
    print('REGISTER DATA:');
    print({
      'firstName': request.firstName,
      'lastName': request.lastName,
      'email': request.email,
      'password': request.password,
    });

    final response = await apiConsumer.post(
      path: ApiConstants.register,
      data: {
        'firstName': request.firstName,
        'lastName': request.lastName,
        'email': request.email,
        'password': request.password,
      },
    );

    print('REGISTER RESPONSE: $response');

    return response;
  }

  @override
  Future<Either<Failure, dynamic>> verifyEmail(
      VerifyEmailRequest request,
      ) async {
    final response = await apiConsumer.post(
      path: ApiConstants.verifyEmail,
      data: {
        'email': request.email,
        'otp': request.otp,
      },
    );

    return response;
  }
  @override
  Future<Either<Failure, dynamic>> resendOtp(
      ResendOtpRequest request,
      ) async {
    final response = await apiConsumer.post(
      path: ApiConstants.resendOtp,
      data: {
        'email': request.email,
      },
    );

    return response;
  }
}