// import 'package:_bot/utils.dart';
// ignore_for_file: non_constant_identifier_names, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, empty_catches
import "package:faxl_lib/faxl_lib.dart";
// import 'package:/.dart';
import "package:path/path.dart" as path;
import 'package:translate_client/translate_client.dart';
import 'package:universal_io/io.dart';

void main(List<String> args) async {
  List<String> language_codes = [
    "en",
    "cn",
    "ru",
    "sg",
    "th",
    "ko",
    "tw",
    "hk",
    "sa",
    "my",
  ];
  await jsonToLanguageScript(
    language_raw: language_raw,
    default_language_code_id: "id",
    directory: Directory(path.join(Directory.current.path, "lib", "language")),
    is_translate: false,
    onData: (String origin_data, language_code_id, default_language_code_id) async {
      if (language_codes.contains(language_code_id)) {
        RegExp regExp = RegExp(r"({[a-z0-9_]+})", caseSensitive: false);
        if (regExp.hashData(origin_data)) {
          List<RegExpMatch> regExpMatchs = regExp.allMatches(origin_data).toList();
          List<String> msgs = origin_data.split(regExp);
          String result_msg = "";
          for (var i = 0; i < msgs.length; i++) {
            String msg_part = msgs[i];
            try {
              result_msg += (await TranslateClient.translate(
                text: msg_part,
                toLanguageCode: language_code_id,
                fromLanguageCode: default_language_code_id,
              ));
            } catch (e) {
              result_msg += msg_part;
            }
            try {
              RegExpMatch regExpMatch = regExpMatchs[i];
              String data = regExpMatch.group(1) ?? "";
              if (data.isNotEmpty) {
                result_msg += "${data}";
              }
            } catch (e) {}
          }
          return result_msg;
        } else {
          try {
            return (await TranslateClient.translate(
              text: origin_data,
              toLanguageCode: language_code_id,
              fromLanguageCode: default_language_code_id,
            ));
          } catch (e) {}
        }
      }

      return null;
    },
  );
}

Map language_raw = {
  "account": {
    "account_title": "Akun",
    "id_title": "Id",
    "full_name_title": "Nama Lengkap",
    "username_title": "Nama Pengguna",
    "bio_title": "Bio",
    "upgrade_title": "Upgrade Plan",
  },
  "settings": {
    "settings_title": "Pengaturan",
    "privacy_and_security_title": "Privasi Dan Keamanan",
    "notification_and_sound_title": "Notifikasi Dan Suara",
    "devices_title": "Perangkat",
    "language_title": "Bahasa",
  },
  "app": {
    "chatbot_assistant_title": "Chatbot Asisten",
    "license_title": "Lisensi",
    "privacy_policy_title": "Kebijakan Pribadi",
  },
};
