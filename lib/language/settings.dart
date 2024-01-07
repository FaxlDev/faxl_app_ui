// ignore_for_file: non_constant_identifier_names

import "language_core.dart";
import "language_code_data.dart"; 

extension SettingsExtensionLanguage on Language {


    /// default return
    /// ```dart
    /// "Pengaturan";
    /// ```
    String settings_settings_title({
      String? languageCode,
      List<Map<String, String>>? replacesDatas,
    }) {
      Map language_raw_data = {"id":"Pengaturan"};

      return sendLanguage( 
        languageCodeData: LanguageCodeData(
          language_raw_data,
        ),
        id: "settings_settings_title",
        replacesDatas: replacesDatas,
        languageCode: languageCode,
      );
     
    }    /// default return
    /// ```dart
    /// "Privasi Dan Keamanan";
    /// ```
    String settings_privacy_and_security_title({
      String? languageCode,
      List<Map<String, String>>? replacesDatas,
    }) {
      Map language_raw_data = {"id":"Privasi Dan Keamanan"};

      return sendLanguage( 
        languageCodeData: LanguageCodeData(
          language_raw_data,
        ),
        id: "settings_privacy_and_security_title",
        replacesDatas: replacesDatas,
        languageCode: languageCode,
      );
     
    }    /// default return
    /// ```dart
    /// "Notifikasi Dan Suara";
    /// ```
    String settings_notification_and_sound_title({
      String? languageCode,
      List<Map<String, String>>? replacesDatas,
    }) {
      Map language_raw_data = {"id":"Notifikasi Dan Suara"};

      return sendLanguage( 
        languageCodeData: LanguageCodeData(
          language_raw_data,
        ),
        id: "settings_notification_and_sound_title",
        replacesDatas: replacesDatas,
        languageCode: languageCode,
      );
     
    }    /// default return
    /// ```dart
    /// "Perangkat";
    /// ```
    String settings_devices_title({
      String? languageCode,
      List<Map<String, String>>? replacesDatas,
    }) {
      Map language_raw_data = {"id":"Perangkat"};

      return sendLanguage( 
        languageCodeData: LanguageCodeData(
          language_raw_data,
        ),
        id: "settings_devices_title",
        replacesDatas: replacesDatas,
        languageCode: languageCode,
      );
     
    }    /// default return
    /// ```dart
    /// "Bahasa";
    /// ```
    String settings_language_title({
      String? languageCode,
      List<Map<String, String>>? replacesDatas,
    }) {
      Map language_raw_data = {"id":"Bahasa"};

      return sendLanguage( 
        languageCodeData: LanguageCodeData(
          language_raw_data,
        ),
        id: "settings_language_title",
        replacesDatas: replacesDatas,
        languageCode: languageCode,
      );
     
    }

}