import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool _saving = false;

  bool get saving => _saving;

  set saving(bool val) {
    _saving = val;

    notifyListeners();
  }

  bool isValid = false;

  bool isValidFrm() {
    print('$email - $password');

    return formKey.currentState?.validate() ?? false;
  }
}
