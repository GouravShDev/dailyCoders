part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required String emailAddress,
    required String password,
    // state to indicate whelter the form is being submit or not
    required bool isSubmitting,
    // state to show if action performed successfully or not
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        emailAddress: '',
        password: '',
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
