abstract class StateStatus {
  const StateStatus();
}

class InitialFormStatus extends StateStatus {
  const InitialFormStatus();
}

class ErrorStatusWithException extends StateStatus {
  final Exception e;

  const ErrorStatusWithException({required this.e});
}

class ErrorOccurredStatus extends StateStatus {}

class ExceptionStatusWithMessage extends StateStatus {
  final String message;

  const ExceptionStatusWithMessage({required this.message});
}


class SubmissionPassed extends StateStatus {

  const SubmissionPassed();
}

