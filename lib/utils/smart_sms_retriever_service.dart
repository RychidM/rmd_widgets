import 'package:pinput/pinput.dart';
import 'package:smart_auth/smart_auth.dart';

class RMSmartSmsRetrieverService implements SmsRetriever {
  final SmartAuth smartAuth;

  RMSmartSmsRetrieverService(this.smartAuth);

  @override
  Future<void> dispose() {
    return smartAuth.removeSmsRetrieverApiListener();
  }

  @override
  Future<String?> getSmsCode() async {
    try {
      final response = await smartAuth.getSmsWithUserConsentApi();
      return response.data?.code;
    } on Exception {
      rethrow;
    }
  }

  @override
  bool get listenForMultipleSms => true;
}
