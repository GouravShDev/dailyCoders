// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'layers/domain/auth/i_auth_fascade.dart' as _i5;
import 'layers/domain/users/i_user_repository.dart' as _i7;
import 'layers/infrastructure/auth/firebase_auth_fascade.dart' as _i6;
import 'layers/infrastructure/core/injectable_module.dart' as _i11;
import 'layers/infrastructure/users/user_repository.dart' as _i8;
import 'layers/ui/blocs/auth/auth_bloc.dart' as _i10;
import 'layers/ui/blocs/sign_in_form/sign_in_form_bloc.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(() => injectableModule.firebaseAuth);
  gh.lazySingleton<_i4.FirebaseFirestore>(() => injectableModule.firestore);
  gh.singleton<_i5.IAuthFacade>(_i6.FirebaseAuthFacade(
      get<_i3.FirebaseAuth>(), get<_i4.FirebaseFirestore>()));
  gh.factory<_i7.IUserRepository>(() => _i8.UserRepository(
      get<_i4.FirebaseFirestore>(), get<_i3.FirebaseAuth>()));
  gh.factory<_i9.SignInFormBloc>(
      () => _i9.SignInFormBloc(get<_i5.IAuthFacade>()));
  gh.factory<_i10.AuthBloc>(() => _i10.AuthBloc(get<_i5.IAuthFacade>()));
  return get;
}

class _$InjectableModule extends _i11.InjectableModule {}
