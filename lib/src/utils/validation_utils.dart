/// ValidationUtils is used for validation
extension ValidationUtils on String {
  /// Name
  String? validName({bool ignoreEmpty = true}) {
    if (isEmpty && ignoreEmpty) {
      return null;
    } else if (trim().length < 2) {
      return 'Name should have more than 2 characters';
    } else {
      return null;
    }
  }

  /// Email
  String? validEmail({bool ignoreEmpty = true, bool alreadyExist = false}) {
    if (isEmpty && ignoreEmpty) {
      return null;
    } else if (!emailRegex.hasMatch(trim())) {
      return 'Please enter a valid email';
    } else if (alreadyExist) {
      return 'Email already exists';
    } else {
      return null;
    }
  }

  /// Mobile
  String? validMobile() {
    if (trim().isEmpty) {
      return null;
    } else if (!mobileRegex.hasMatch(trim())) {
      return 'Mobile number should between 6 and 20 character';
    } else {
      return null;
    }
  }
}

/// Email
RegExp emailRegex = RegExp(
    r'''^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))''');

/// Mobile
RegExp mobileRegex = RegExp(r'(^(?:[+0][0-9])?[0-9]{6,20}$)');
