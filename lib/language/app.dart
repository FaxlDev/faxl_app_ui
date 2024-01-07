// ignore_for_file: non_constant_identifier_names

import "language_core.dart";
import "language_code_data.dart"; 

extension AppExtensionLanguage on Language {


    /// default return
    /// ```dart
    /// "Chatbot Asisten";
    /// ```
    String app_chatbot_assistant_title({
      String? languageCode,
      List<Map<String, String>>? replacesDatas,
    }) {
      Map language_raw_data = {"id":"Chatbot Asisten"};

      return sendLanguage( 
        languageCodeData: LanguageCodeData(
          language_raw_data,
        ),
        id: "app_chatbot_assistant_title",
        replacesDatas: replacesDatas,
        languageCode: languageCode,
      );
     
    }    /// default return
    /// ```dart
    /// "Lisensi";
    /// ```
    String app_license_title({
      String? languageCode,
      List<Map<String, String>>? replacesDatas,
    }) {
      Map language_raw_data = {"id":"Lisensi"};

      return sendLanguage( 
        languageCodeData: LanguageCodeData(
          language_raw_data,
        ),
        id: "app_license_title",
        replacesDatas: replacesDatas,
        languageCode: languageCode,
      );
     
    }    /// default return
    /// ```dart
    /// "Kebijakan Pribadi";
    /// ```
    String app_privacy_policy_title({
      String? languageCode,
      List<Map<String, String>>? replacesDatas,
    }) {
      Map language_raw_data = {"id":"Kebijakan Pribadi"};

      return sendLanguage( 
        languageCodeData: LanguageCodeData(
          language_raw_data,
        ),
        id: "app_privacy_policy_title",
        replacesDatas: replacesDatas,
        languageCode: languageCode,
      );
     
    }

}