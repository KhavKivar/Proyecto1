import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
}



class ServerFailure implements Failure {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
  
}

class CacheFailure implements Failure {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
