class ValidationUtils {
  static bool isValidateUserName(String email) {
    return !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(email!);
  }

  static bool isValidatePassword(String password) {
    return password!.isEmpty;
  }

  static bool isValidateFullName(String fullName) {
    return fullName!.isEmpty;
  }

  static bool isValidateMobileNumber(String mobileNumber) {
    return mobileNumber!.isEmpty;
  }

  static bool isValidateVerificationCode(String resetCode) {
    return resetCode!.isEmpty;
  }
}
