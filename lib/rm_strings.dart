class RmStrings {
  RmStrings._();

  static const String rPhoneNumberRegex = r"^(\d{1,3}[-]?)?\d{10}$";
  static const String rPhoneNumberWithoutCtryCodeRegex = r"^\d{7,10}$";
  static const String rRequiredText = "Required";
}
