import 'package:pinput/pinput.dart';
import 'package:smart_auth/smart_auth.dart';

class SmartSmsRetrieverService implements SmsRetriever {
  final SmartAuth smartAuth;

  SmartSmsRetrieverService(this.smartAuth);
  @override
  Future<void> dispose() {
    return smartAuth.removeSmsListener();
  }

  @override
  Future<String?> getSmsCode() async {
    final response = await smartAuth.getSmsCode(
      useUserConsentApi: true,
    );
    if(response.succeed && response.codeFound) {
      return response.code;
    }
    return null;
  }

  @override
  bool get listenForMultipleSms => true;
}