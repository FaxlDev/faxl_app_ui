// ignore_for_file: non_constant_identifier_names

import "language_core.dart";
import "language_code_data.dart"; 

extension AccountExtensionLanguage on Language {


    /// default return
    /// ```dart
    /// "Akun";
    /// ```
    String account_account_title({
      String? languageCode,
      List<Map<String, String>>? replacesDatas,
    }) {
      Map language_raw_data = {"id":"Akun"};

      return sendLanguage( 
        languageCodeData: LanguageCodeData(
          language_raw_data,
        ),
        id: "account_account_title",
        replacesDatas: replacesDatas,
        languageCode: languageCode,
      );
     
    }    /// default return
    /// ```dart
    /// "Id";
    /// ```
    String account_id_title({
      String? languageCode,
      List<Map<String, String>>? replacesDatas,
    }) {
      Map language_raw_data = {"id":"Id"};

      return sendLanguage( 
        languageCodeData: LanguageCodeData(
          language_raw_data,
        ),
        id: "account_id_title",
        replacesDatas: replacesDatas,
        languageCode: languageCode,
      );
     
    }    /// default return
    /// ```dart
    /// "Nama Lengkap";
    /// ```
    String account_full_name_title({
      String? languageCode,
      List<Map<String, String>>? replacesDatas,
    }) {
      Map language_raw_data = {"id":"Nama Lengkap"};

      return sendLanguage( 
        languageCodeData: LanguageCodeData(
          language_raw_data,
        ),
        id: "account_full_name_title",
        replacesDatas: replacesDatas,
        languageCode: languageCode,
      );
     
    }    /// default return
    /// ```dart
    /// "Nama Pengguna";
    /// ```
    String account_username_title({
      String? languageCode,
      List<Map<String, String>>? replacesDatas,
    }) {
      Map language_raw_data = {"id":"Nama Pengguna"};

      return sendLanguage( 
        languageCodeData: LanguageCodeData(
          language_raw_data,
        ),
        id: "account_username_title",
        replacesDatas: replacesDatas,
        languageCode: languageCode,
      );
     
    }    /// default return
    /// ```dart
    /// "Bio";
    /// ```
    String account_bio_title({
      String? languageCode,
      List<Map<String, String>>? replacesDatas,
    }) {
      Map language_raw_data = {"id":"Bio"};

      return sendLanguage( 
        languageCodeData: LanguageCodeData(
          language_raw_data,
        ),
        id: "account_bio_title",
        replacesDatas: replacesDatas,
        languageCode: languageCode,
      );
     
    }    /// default return
    /// ```dart
    /// "Upgrade Plan";
    /// ```
    String account_upgrade_title({
      String? languageCode,
      List<Map<String, String>>? replacesDatas,
    }) {
      Map language_raw_data = {"id":"Upgrade Plan"};

      return sendLanguage( 
        languageCodeData: LanguageCodeData(
          language_raw_data,
        ),
        id: "account_upgrade_title",
        replacesDatas: replacesDatas,
        languageCode: languageCode,
      );
     
    }

}