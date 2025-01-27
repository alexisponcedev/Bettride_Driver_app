class Helper {
  static bool isEmail(String em) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(em);
  }

  static bool isPassword(String em) {
    return em.length > 5;
  }

  static bool isPhoneNumber(String em) {
    return (RegExp(r'^[0-9]').hasMatch(em) && em.length >= 8);
  }

  static bool isCardNumber(String em) {
    return (RegExp(r'^[0-9]').hasMatch(em) && em.length >= 16);
  }

  static bool iscvv(String em) {
    return (RegExp(r'^[0-9]').hasMatch(em) && em.length >= 3);
  }

  static String? validateEmail(String? value) {
    if (value != "") {
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = RegExp(pattern);
      if (!regex.hasMatch(value ?? ''))
        return "Please enter a valid email";
      else
        return null;
    } else {
      return null;
    }
  }

  static String? validateName(String? value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(pattern);
    if (value?.length == 0) {
      return "Please enter name";
    } else if (!regExp.hasMatch(value ?? '')) {
      return "Please enter a valid name";
    }
    return null;
  }

  static String? validateEmpty(String? value) {
    if (value == "") {
      return "Filed is required";
    } else {
      return null;
    }
  }
}
