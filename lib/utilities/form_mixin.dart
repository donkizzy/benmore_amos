import 'package:flutter/material.dart';

mixin FormMixin {
  /// checks if any fields are empty
  String? isRequired(String? value) {
    if (value == null || value == '') {
      return 'This field is required';
    }
    return null;
  }

  String? isValidEmailAddress(String? value) {
    final emailAddressRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value?.isEmpty ?? true) {
      return 'This field is required';
    } else if (!emailAddressRegex.hasMatch(value!)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? isValidPhoneNumber(String? value) {
    //final phoneNumberRegex = RegExp(r'(^(?:[+0]9)?[0-9]{11,14}$)');
    if (value == null || value == '') {
      return 'This field is required';
    }
    // if(!phoneNumberRegex.hasMatch(value)){
    //   return 'Phone Number isn\'t Valid' ;
    // }
    return null;
  }

  /// Validates the required fields and calls a save method on the form
  bool validateAndSaveOnSubmit(BuildContext ctx) {
    final form = Form.of(ctx);

    if (!form.validate()) {
      return false;
    }

    form.save();
    return true;
  }

  FormFieldValidator<String> validatePassword({
    bool shouldContainNumber = true,
    bool shouldContainSpecialChars = true,
    bool shouldContainCapitalLetter = true,
    bool shouldContainSmallLetter = true,
  }) {
    return (fieldValue) {
      if (fieldValue == null || fieldValue.trim().isEmpty) {
        return "Password is required";
      }
      if (fieldValue.length < 6) {
        return "Password length is not valid";
      }

      if (shouldContainNumber && !RegExp(r"[0-9]+").hasMatch(fieldValue)) {
        return "Password must contain a number";
      }

      if (shouldContainCapitalLetter && !RegExp(r"[A-Z]+").hasMatch(fieldValue)) {
        return "Password must contain a capital letter";
      }

      if (shouldContainSmallLetter && !RegExp(r"[a-z]+").hasMatch(fieldValue)) {
        return "Password must contain a small letter";
      }

      if (shouldContainSpecialChars && !RegExp(r"['^£$%!&*()}{@#~?><,.|=_+¬-]").hasMatch(fieldValue)) {
        return "Password must contain a special character";
      }

      return null;
    };
  }
}
