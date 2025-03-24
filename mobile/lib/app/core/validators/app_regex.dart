sealed class AppRegex {
  static RegExp phoneNumberRegex = RegExp(
    r'^(\+55|55)?\s?(?:(?:\d{2})?[\s.-]?)?(?:\d{2})?\s?(?:9?\d{4}[\s.-]?\d{4}|\d{4}[\s.-]?\d{4})$',
  );

  static RegExp onlyNumberRegex = RegExp(r'[a-zA-Z0-9./-]');
}
