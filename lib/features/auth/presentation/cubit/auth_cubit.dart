import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm_2/features/auth/data/models/login_req.dart';
import 'package:mm_2/features/auth/data/models/signup_req.dart';
import 'package:mm_2/features/auth/data/models/verify_req.dart';
import 'package:mm_2/features/auth/data/models/resend.dart';
import 'package:mm_2/features/auth/domain/usecase/login.dart';
import 'package:mm_2/features/auth/domain/usecase/signup.dart';
import 'package:mm_2/features/auth/domain/usecase/verify_email.dart';
import 'package:mm_2/features/auth/domain/usecase/resend_otp.dart';
import 'package:mm_2/core/local_storage/base_local_storage.dart';
import 'package:mm_2/core/constant/local_keys.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final Login loginUseCase;
  final SignUp signUpUseCase;
  final VerifyEmail verifyEmailUseCase;
  final ResendOtp resendOtpUseCase;
  final BaseLocalStorage localStorage;

  AuthCubit({
    required this.loginUseCase,
    required this.signUpUseCase,
    required this.verifyEmailUseCase,
    required this.resendOtpUseCase,
    required this.localStorage,
  }) : super(AuthInitial());

  Future<void> register(SignupRequest request) async {
    print('REGISTER METHOD CALLED');

    emit(AuthLoading());

    final result = await signUpUseCase(request);

    result.fold(
          (failure) {
        print('REGISTER ERROR: $failure');
        emit(AuthFailure(failure.toString()));
      },
          (response) {
        print('REGISTER SUCCESS: $response');
        emit(AuthSuccess());
      },
    );
  }

  Future<void> login(LoginRequest request) async {
    emit(AuthLoading());

    final result = await loginUseCase(request);

    result.fold(
          (failure) {
        print('========== LOGIN ERROR ==========');
        print(failure);
        print('=================================');

        emit(AuthFailure(failure.toString()));
      },
          (response) async {
        print('========== LOGIN RESPONSE ==========');
        print(response);
        print('====================================');

        final accessToken = response['accessToken'];

        if (accessToken != null && accessToken.toString().isNotEmpty) {
          await localStorage.setString(
            LocalKeys.token,
            accessToken.toString(),
          );

          print('========== TOKEN SAVED SUCCESSFULLY ==========');
        }

        emit(AuthSuccess());
      },
    );
  }

  Future<void> verify(VerifyEmailRequest request) async {
    emit(AuthLoading());

    final result = await verifyEmailUseCase(request);

    result.fold(
          (failure) {
        emit(AuthFailure(failure.toString()));
      },
          (response) {
        emit(AuthSuccess());
      },
    );
  }

  Future<void> resend(ResendOtpRequest request) async {
    emit(AuthLoading());

    final result = await resendOtpUseCase(request);

    result.fold(
          (failure) {
        emit(AuthFailure(failure.toString()));
      },
          (response) {
        emit(AuthSuccess());
      },
    );
  }
}