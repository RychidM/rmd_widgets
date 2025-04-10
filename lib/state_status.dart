import 'package:equatable/equatable.dart';

abstract class StateStatus extends Equatable {
  const StateStatus();
}

class InitialFormStatus extends StateStatus {
  const InitialFormStatus();

  @override
  List<Object?> get props => [];
}

class ErrorStatusWithException extends StateStatus {
  final Exception e;

  const ErrorStatusWithException({required this.e});

  @override
  List<Object?> get props => [e];
}

class ErrorOccurredStatus extends StateStatus {
  @override
  List<Object?> get props => [];
}

class ExceptionStatusWithMessage extends StateStatus {
  final String message;

  const ExceptionStatusWithMessage({required this.message});

  @override
  List<Object?> get props => [message];
}


class SubmissionPassed extends StateStatus {

  const SubmissionPassed();

  @override
  List<Object?> get props => [];
}

class SubmissionFailed extends StateStatus {
  final String failMessage;

  const SubmissionFailed(this.failMessage);

  @override
  List<Object?> get props => [];
}

