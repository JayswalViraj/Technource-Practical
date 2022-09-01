class Validates {
  static validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value) || value == null) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  static validatePassword(String value) {
    if (value!.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 7) {
      return 'Password more than 6 charater';
    }
  }

  static validateFullName(String value) {
    if (value.isEmpty) {
      return 'Please enter full name';
    }
  }

  static validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Please enter phone number';
    }
    if (value.length < 11) {
      return 'Please enter your 10 digit phone number';
    }
  }
}
