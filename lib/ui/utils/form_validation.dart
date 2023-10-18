String? nameValidator(String? input) {
  if (input == null || input.trim().length < 2) {
    return 'Name must be 2 characters long';
  } else {
    return null;
  }
}

String? otpValidator(String? input, String otp) {
  if (input != null && input.isEmpty) {
    return 'Please Enter your Otp Number';
  } else if (input != otp.toString()) {
    return 'Invalid Otp';
  }
  return null;
}

String? emailValidator(String? input) {
  RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  if (input == null || !emailRegex.hasMatch(input)) {
    return 'Enter valid email Address';
  } else {
    return null;
  }
}

String? passValidator(String? input) {
  if (input == null || input.trim().length < 8) {
    return 'Password must be 8 characters long';
  } else {
    return null;
  }
}

String? phoneValidator(String? input) {
  if (input == null || input.trim().length < 10) {
    return 'Password must be 10 characters long';
  } else {
    return null;
  }
}

String? confirmPassValidator(String? input, String password) {
  if (input == null || input.trim().length < 8) {
    return 'Password must be 8 characters long';
  } else if (input != password) {
    return "password doesn't match";
  }
  return null;
}
