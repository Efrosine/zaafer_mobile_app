abstract class UseCase<Type> {
  Type call();
}

abstract class UseCaseParams<Type, Params> {
  Type call(Params? params);
}

abstract class FutureUseCase<Type> {
  Future<Type> call();
}

abstract class FutureUseCaseParams<Type, Params> {
  Future<Type> call(Params? params);
}

abstract class StreamUseCase<Type> {
  Stream<Type> call();
}

abstract class StreamUseCaseParams<Type, Params> {
  Stream<Type> call(Params? params);
}
