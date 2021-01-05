import 'package:flutter/material.dart';
import 'package:enquete_dev/ui/pages/login/login_page.dart';
import 'package:enquete_dev/main/factories/factories.dart';

Widget makeLoginPage() {
  return LoginPage(makeLoginPresenter());
}
