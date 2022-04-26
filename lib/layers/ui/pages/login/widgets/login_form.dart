import 'package:daily_coders/core/utils/size_config.dart';
import 'package:daily_coders/core/utils/strings.dart';
import 'package:daily_coders/layers/ui/blocs/sign_in_form/sign_in_form_bloc.dart';
import 'package:daily_coders/layers/ui/common_widgets/rounded_button.dart';
import 'package:daily_coders/layers/ui/common_widgets/rounded_input_field.dart';
import 'package:daily_coders/layers/ui/common_widgets/rounded_password_field.dart';
import 'package:daily_coders/layers/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // form key to validate the form
  final _formKey = GlobalKey<FormState>();
  bool isSignUp = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: BlocConsumer<SignInFormBloc, SignInFormState>(
        listener: (context, state) {
          // shows snackbar when any error occured while signing in
          state.authFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold((failure) {
              // mapping string values for different kind of errors
              final String message = failure.maybeMap(
                cancelledByUser: (_) => "Cancelled",
                serverError: (_) => "Server error",
                emailAlreadyInUse: (_) => "Email already in Use",
                invalidEmailAndPasswordCombination: (_) =>
                    "Invalid email and password combination",
                orElse: () => "Unexpected error",
              );
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(message)));
            }, (_) {
              // user successfully sign in
              Navigator.of(context).pushReplacementNamed(HomePage.route);
            }),
          );
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  Strings.appName,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                RoundedInputField(
                  hintText: Strings.email,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    context
                        .read<SignInFormBloc>()
                        .add(SignInFormEvent.emailChanged(value));
                  },
                ),
                RoundedPasswordField(
                  onChanged: (value) {
                    context
                        .read<SignInFormBloc>()
                        .add(SignInFormEvent.passwordChanged(value));
                  },
                ),
                // shows confirm password field only on sign up
                if (isSignUp)
                  RoundedPasswordField(
                    onChanged: (_) {},
                    validator: (value) {
                      // simple validation for matching password
                      final password =
                          context.read<SignInFormBloc>().state.password;
                      if (value != password) {
                        return "Password doesn't match";
                      }
                      return null;
                    },
                    isConfirmPass: true,
                  ),
                RoundedButton(
                  text: isSignUp ? Strings.signUp : Strings.logIn,
                  onPress: () {
                    // perform action based on the current state of the form
                    if (isSignUp) {
                      // registering user
                      context.read<SignInFormBloc>().add(
                            const SignInFormEvent
                                .registerWithEmailAndPasswordPressed(),
                          );
                    } else {
                      // logins user
                      context.read<SignInFormBloc>().add(
                            const SignInFormEvent
                                .signInWithEmailAndPasswordPressed(),
                          );
                    }
                  },
                  color: Theme.of(context).primaryColorDark,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),

                if (!isSignUp)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        Strings.dontHaveAnAccount,
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isSignUp = true;
                          });
                        },
                        child: Text(
                          Strings.signUp,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                if (isSignUp)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        Strings.alreadyHaveAnAccount,
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isSignUp = false;
                          });
                        },
                        child: Text(
                          Strings.logIn,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
