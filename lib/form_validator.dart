import 'package:form_field_validator/form_field_validator.dart';
import 'package:rmdev_widgets/rm_strings.dart';

class RmFormValidator {
  static RequiredValidator requiredValidator =
      RequiredValidator(errorText: "Required");

  static NoValidation dontValidate = NoValidation();

  static MultiValidator emailValidator = MultiValidator(
    [
      RequiredValidator(errorText: "Required"),
      EmailValidator(errorText: "Provide a valid email address"),
    ],
  );

  static MultiValidator validateCardExp(String expDate) {
    return MultiValidator(
      [
        CardExpValidation(expDate, errorText: "Provide a valid exp date"),
      ],
    );
  }

  static MultiValidator validateCardNumber = MultiValidator(
    [
      RequiredValidator(errorText: "Required"),
      CardNumberValidator(errorText: "Provide a valid card number"),
    ],
  );

  static MultiValidator validateAmount(String amount,
      [double minAmount = 1.0]) {
    return MultiValidator(
      [
        RequiredValidator(errorText: "Required"),
        AmountValidator(amount,
            errorText: "Amount should not be less than $minAmount",
            minAmount: minAmount),
      ],
    );
  }

  static MultiValidator strongPasswordValidator = MultiValidator(
    [
      RequiredValidator(errorText: "Required"),
      MinLengthValidator(8, errorText: "Password must be at least 8 characters long"),
      PatternValidator(r'(?=.*[A-Z])', errorText: "Password must contain at least one uppercase letter"),
      PatternValidator(r'(?=.*[a-z])', errorText: "Password must contain at least one lowercase letter"),
      PatternValidator(r'(?=.*\d)', errorText: "Password must contain at least one digit"),
      PatternValidator(r'(?=.*[@$!%*?&])', errorText: "Password must contain at least one special character"),
    ],
  );

  static MultiValidator validatePasswordMatch(
      String password, String confirmPassword) {
    return MultiValidator(
      [
        RequiredValidator(errorText: "Required"),
        PasswordMatchValidator(password, confirmPassword,
            errorText: "Passwords do not match"),
      ],
    );
  }

  static MultiValidator phoneNumberValidator = MultiValidator(
    [
      RequiredValidator(errorText: "Required"),
      PatternValidator(RmStrings.rPhoneNumberRegex,
          errorText: "Invalid phone number"),
    ],
  );

  static MultiValidator phoneNumberCountryCodeValidator = MultiValidator(
    [
      RequiredValidator(errorText: RmStrings.rRequiredText),
      PatternValidator(
        RmStrings.rPhoneNumberWithoutCtryCodeRegex,
        errorText: 'Remove country from input',
      ),
    ],
  );
}

class PasswordMatchValidator extends TextFieldValidator {
  final String password;
  final String confirmPassword;

  PasswordMatchValidator(this.password, this.confirmPassword,
      {required String errorText})
      : super(errorText);

  @override
  bool isValid(String? value) {
    return password == confirmPassword;
  }
}

class AmountValidator extends TextFieldValidator {
  final String amount;
  final double minAmount;

  AmountValidator(this.amount,
      {required String errorText, required this.minAmount})
      : super(errorText);

  @override
  bool isValid(String? value) {
    try {
      final numericValue = num.parse(value!);
      return (numericValue >= minAmount);
    } catch (_) {
      return false;
    }
  }
}

class NoValidation extends TextFieldValidator {
  NoValidation() : super('');

  @override
  bool isValid(String? value) {
    return true;
  }
}

class CardExpValidation extends TextFieldValidator {
  final String expDate;

  CardExpValidation(this.expDate, {required String errorText})
      : super(errorText);

  @override
  bool isValid(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    var parts = value.split('/');
    if (parts.length != 2) {
      return false;
    }
    var month = int.tryParse(parts[0]);
    var year = int.tryParse('20${parts[1]}');
    if (month == null || month < 1 || month > 12) {
      return false;
    }
    if (year == null ||
        year < DateTime.now().year ||
        (year == DateTime.now().year && month < DateTime.now().month)) {
      return false;
    }
    return true;
  }
}

class CardNumberValidator extends TextFieldValidator {
  CardNumberValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    // Remove spaces from the card number
    String cardNumber = value.replaceAll(RegExp(r'\s+\b|\b\s'), '');
    // Check if the card number is all digits
    if (!RegExp(r'^\d+$').hasMatch(cardNumber)) {
      return false;
    }
    // Check if the card number passes the Luhn algorithm
    return _checkLuhn(cardNumber);
  }

  bool _checkLuhn(String cardNumber) {
    int sum = 0;
    bool alternate = false;
    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int digit = int.parse(cardNumber[i]);
      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit = (digit % 10) + 1;
        }
      }
      sum += digit;
      alternate = !alternate;
    }
    return sum % 10 == 0;
  }
}
