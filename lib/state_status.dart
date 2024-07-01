sealed class StateStatus {
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