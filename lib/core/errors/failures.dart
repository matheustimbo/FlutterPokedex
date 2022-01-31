import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ApiFailure extends Failure {
  final String message;

  ApiFailure(this.message);

  @override
  List<Object?> get props => [message];
}
