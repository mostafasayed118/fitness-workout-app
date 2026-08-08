class TextValidator {
  static String? validateEmptyText(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid Email Address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  static String? validatecomfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*]'))) {
      return 'Password must contain at least one special character';
    }
    if (value != password) {
      return 'Password does not match';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (value.length < 11) {
      return 'Phone number must be at least 11 characters';
    }

    if (value.length > 12) {
      return 'Phone number must be at most 11 characters';
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }

    return null;
  }

  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Age is required';
    }
    if (int.tryParse(value) == null) {
      return 'Age must be a number';
    }
    if (int.tryParse(value)! < 16) {
      return 'Age must be at least 16 years';
    }
    return null;
  }

  static String? validateHeight(String? value) {
    if (value == null || value.isEmpty) {
      return 'Height is required';
    }
    if (int.tryParse(value) == null) {
      return 'Height must be a number';
    }

    if (int.tryParse(value)! < 50) {
      return 'Height must be at least 50 cm';
    }
    if (int.tryParse(value)! > 250) {
      return 'Height must be at most 250 cm';
    }
    return null;
  }

  static String? validateWeight(String? value) {
    if (value == null || value.isEmpty) {
      return 'Weight is required';
    }
    if (int.tryParse(value) == null) {
      return 'Weight must be a number';
    }
    return null;
  }

  static String? validateDose(String? value) {
    if (value == null || value.isEmpty) {
      return 'Dose is required';
    }
    if (int.tryParse(value) == null) {
      return 'Dose must be a number';
    }
    if (int.tryParse(value)! < 1) {
      return 'Dose must be at least 1';
    }
    if (int.tryParse(value)! > 10) {
      return 'Dose must be at most 10';
    }

    return null;
  }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Date is required';
    }
    if (int.tryParse(value) == null) {
      return 'Date must be a number';
    }

    return null;
  }

  static String? validateCountry(String? value) {
    if (value == null || value.isEmpty) {
      return 'Country is required';
    }
    if (value.length < 3) {
      return 'Country must be at least 3 characters';
    }

    return null;
  }
}
