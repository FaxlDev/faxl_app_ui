// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, unused_local_variable, unnecessary_brace_in_string_interps

import 'package:faxl_app_ui/faxl_client/faxl_client.dart';
import 'package:faxl_app_ui/language/language.dart';
import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';
import "package:path/path.dart" as path;
import "package:faxl_lib/faxl_lib.dart";

class FaxlAppUiCore {
  ValueNotifier<ThemeMode> themeModeNotifier;
  // Session session_active = Session({});
  late final FaxlClient faxlClient;
  late final Directory directory_app;
  late final String app_id;
  late Language language;
  FaxlAppUiCore({
    required this.themeModeNotifier,
  });

  Future<void> ensureInitialized({
    required BuildContext context,
    required List<String> crypto_keys,
    required String url_api,
    bool is_invoke_throw_on_error = false,
    String cryptoIv = "AAAAAAAAAAAAAAAAAAAAAA==",
    String event_invoke = "faxl_client_invoke",
    String event_update = "faxl_client_update",
    bool is_local = false,
  }) async {
    language = Language(
      replaceData: [],
      languageCode: () {
        try {
          return (dart.localeName).split("_").first;
        } catch (e) {
          return "";
        }
      }(),
    );
    Directory get_app_docs_dir = await getApplicationSupportDirectory();
    directory_app = Directory(path.join(get_app_docs_dir.path, "database"));
    if (!directory_app.existsSync()) {
      await directory_app.create(recursive: true);
    }
  }
}
