

class AppValidators {
  AppValidators();

  static String? validateEmail(String? val) {
    RegExp emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (val == null || val.trim().isEmpty) {
      return 'Please enter your email';
    } else if (emailRegex.hasMatch(val) == false) {
      return 'Enter valid email';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    RegExp passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
    if (val == null || val.trim().isEmpty) {
      return 'Please enter your password';
    } else if (val.length < 8 || !passwordRegex.hasMatch(val)) {
      return 'password must be at least 8 characters and contain numbers & letters & special characters';
    } else {
      return null;
    }
  }
  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.trim().isEmpty) {
      return 'Please reEnter your password';
    } else if (val != password) {
      return 'passwords do not match';
    } else {
      return null;
    }
  }
  static String? validateUsername(String? val) {
    RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (val == null  || val.trim().isEmpty) {
      return 'Please enter your username';
    } else if (!usernameRegex.hasMatch(val)) {
      return 'Enter valid username';
    } else {
      return null;
    }

  }
  static String? validateFullName(String? val) {
    RegExp fullNameRegex = RegExp(r"^[a-zA-Z\s]+$");
    if (val == null || val.isEmpty) {
      return 'Please enter your full name';
    } else if (!fullNameRegex.hasMatch(val)) {
      return 'Enter valid name';
    } else {
      return null;
    }
  }
  static String? validatePhoneNumber(String? val) {
    final RegExp phoneRegExp = RegExp(r'^(01[0-2]|015)\d{8}$');
    if (val == null || val.isEmpty) {
      return "Please enter your phone number.";
    } else if (!phoneRegExp.hasMatch(val)) {
      return "Invalid phone number format. Use 01XXXXXXXXX.";
    }
    return null;
  }

  static bool isEmailValid(String email) {
    return RegExp(r'^[^@]+@[^@]+.[^@]+').hasMatch(email);
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }

  static bool isPasswordValid(String password) {
    return hasLowerCase(password) &&
        hasUpperCase(password) &&
        hasNumber(password) &&
        hasMinLength(password);
  }
}
