import 'package:daily_coders/core/utils/size_config.dart';
import 'package:daily_coders/injection_container.dart';
import 'package:daily_coders/layers/ui/blocs/sign_in_form/sign_in_form_bloc.dart';
import 'package:daily_coders/layers/ui/pages/login/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  // route name for navigation
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => getIt<SignInFormBloc>(),
            child: const LoginForm(),
          ),
        ),
      ),
    );
  }
}
