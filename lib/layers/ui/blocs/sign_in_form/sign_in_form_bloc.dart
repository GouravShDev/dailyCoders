import 'package:bloc/bloc.dart';
import 'package:daily_coders/layers/domain/auth/auth_failure.dart';
import 'package:daily_coders/layers/domain/auth/i_auth_fascade.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_form_bloc.freezed.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) async {
      await event.map(
        emailChanged: (e) async {
          // emit new state with updated email
          emit(
            state.copyWith(
              emailAddress: e.emailStr,
              authFailureOrSuccessOption: none(),
            ),
          );
        },
        passwordChanged: (e) async {
          // emit new state with updated password
          emit(
            state.copyWith(
              password: e.passwordStr,
              authFailureOrSuccessOption: none(),
            ),
          );
        },
        registerWithEmailAndPasswordPressed: (e) async {
          // emit loading state
          emit(
            state.copyWith(
              // indicates form is submitting
              isSubmitting: true,
              authFailureOrSuccessOption: none(),
            ),
          );

          final Either<AuthFailure, Unit> failureOrSuccess =
              await _authFacade.registerWithEmailAndPassword(
            emailAddress: state.emailAddress,
            password: state.password,
          );

          // emit new state when register has been performed
          emit(
            state.copyWith(
              // indicates form is submitted
              isSubmitting: false,
              authFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          );
        },
        signInWithEmailAndPasswordPressed: (e) async {
          // emiting loading state
          emit(
            state.copyWith(
              isSubmitting: true,
              authFailureOrSuccessOption: none(),
            ),
          );

          final Either<AuthFailure, Unit> failureOrSuccess =
              await _authFacade.signInWithEmailAndPassword(
            emailAddress: state.emailAddress,
            password: state.password,
          );

          await failureOrSuccess.fold((l) async {
            // failed to login with email and password
            // emit the failure
            emit(
              state.copyWith(
                isSubmitting: false,
                authFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          }, (r) async {
            // successfully signed in
            emit(
              state.copyWith(
                isSubmitting: false,
                authFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          });
        },
      );
    });
  }
}
