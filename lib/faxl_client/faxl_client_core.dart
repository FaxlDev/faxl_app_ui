// ignore_for_file: non_constant_identifier_names

import 'package:faxl_app_ui/faxl_client/scheme/scheme.dart';
import 'package:flutter/material.dart';

class FaxlClient {
  ValueNotifier<ThemeMode> themeModeNotifier;
  Session session_active = Session({});
  List<Account> accounts = [];
  FaxlClient({
    required this.themeModeNotifier,
  });
}
