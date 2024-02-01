import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/auth/data/datasources/firebase/auth_service.dart';
import 'features/auth/data/repositories/auth_repo_impl.dart';
import 'features/auth/domain/repositories/auth_repo.dart';
import 'features/auth/domain/usecases/auth_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initDepedencies() async {
  final auth = FirebaseAuth.instance;
  final pref = await SharedPreferences.getInstance();

  sl
    //service
    ..registerSingleton<AuthService>(AuthService(auth, pref))

    //repository
    ..registerSingleton<AuthRepo>(AuthRepoImpl(sl()))

    //usecases
    ..registerSingleton<SignInUseCase>(SignInUseCase(sl()))
    ..registerSingleton<SignUpUseCase>(SignUpUseCase(sl()))
    ..registerSingleton<SignOutUseCase>(SignOutUseCase(sl()))
    ..registerSingleton<IsSignedInUseCase>(IsSignedInUseCase(sl()))

    //bloc
    ..registerFactory<AuthBloc>(() => AuthBloc(sl(), sl(), sl(), sl()));
}
