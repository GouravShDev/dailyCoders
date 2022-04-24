import 'package:daily_coders/core/utils/size_config.dart';
import 'package:daily_coders/core/utils/strings.dart';
import 'package:daily_coders/layers/ui/common_widgets/rounded_button.dart';
import 'package:daily_coders/layers/ui/common_widgets/rounded_input_field.dart';
import 'package:daily_coders/layers/ui/common_widgets/rounded_password_field.dart';
import 'package:flutter/material.dart';

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
      child: Form(
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
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            // shows confirm password field only on sign up
            if (isSignUp)
              RoundedPasswordField(
                onChanged: (value) {},
                isConfirmPass: true,
              ),
            RoundedButton(
              text: isSignUp ? Strings.signUp : Strings.logIn,
              press: () {},
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
                      style: TextStyle(color: Theme.of(context).primaryColor),
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
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
