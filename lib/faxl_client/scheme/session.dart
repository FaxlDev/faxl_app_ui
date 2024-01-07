// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";



class Session extends JsonScheme {

  
  Session(super.rawData);
   
  static Map get defaultData {
    return {"@type":"session","client_user_id":0,"client_token":"","created_date":0,"last_update_date":0,"program_date":0,"app_id":"","@extra":"","@date":0,"@expire_date":0,"is_default":false};
  }

  
  String? get special_type {
    try {
      if (rawData["@type"] is String == false){
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }


  
  num? get client_user_id {
    try {
      if (rawData["client_user_id"] is num == false){
        return null;
      }
      return rawData["client_user_id"] as num;
    } catch (e) {
      return null;
    }
  }


  
  String? get client_token {
    try {
      if (rawData["client_token"] is String == false){
        return null;
      }
      return rawData["client_token"] as String;
    } catch (e) {
      return null;
    }
  }


  
  num? get created_date {
    try {
      if (rawData["created_date"] is num == false){
        return null;
      }
      return rawData["created_date"] as num;
    } catch (e) {
      return null;
    }
  }


  
  num? get last_update_date {
    try {
      if (rawData["last_update_date"] is num == false){
        return null;
      }
      return rawData["last_update_date"] as num;
    } catch (e) {
      return null;
    }
  }


  
  num? get program_date {
    try {
      if (rawData["program_date"] is num == false){
        return null;
      }
      return rawData["program_date"] as num;
    } catch (e) {
      return null;
    }
  }


  
  String? get app_id {
    try {
      if (rawData["app_id"] is String == false){
        return null;
      }
      return rawData["app_id"] as String;
    } catch (e) {
      return null;
    }
  }


  
  String? get special_extra {
    try {
      if (rawData["@extra"] is String == false){
        return null;
      }
      return rawData["@extra"] as String;
    } catch (e) {
      return null;
    }
  }


  
  num? get special_date {
    try {
      if (rawData["@date"] is num == false){
        return null;
      }
      return rawData["@date"] as num;
    } catch (e) {
      return null;
    }
  }


  
  num? get special_expire_date {
    try {
      if (rawData["@expire_date"] is num == false){
        return null;
      }
      return rawData["@expire_date"] as num;
    } catch (e) {
      return null;
    }
  }


  
  bool? get is_default {
    try {
      if (rawData["is_default"] is bool == false){
        return null;
      }
      return rawData["is_default"] as bool;
    } catch (e) {
      return null;
    }
  }


  
  static Session create({

    String special_type = "session",
    num? client_user_id,
    String? client_token,
    num? created_date,
    num? last_update_date,
    num? program_date,
    String? app_id,
    String special_extra = "",
    num special_date = 0,
    num special_expire_date = 0,
    bool? is_default,
})  {
    // Session session = Session({
Map session_data_create_json = {
  
      "@type": special_type,
      "client_user_id": client_user_id,
      "client_token": client_token,
      "created_date": created_date,
      "last_update_date": last_update_date,
      "program_date": program_date,
      "app_id": app_id,
      "@extra": special_extra,
      "@date": special_date,
      "@expire_date": special_expire_date,
      "is_default": is_default,


};


          session_data_create_json.removeWhere((key, value) => value == null);
Session session_data_create = Session(session_data_create_json);

return session_data_create;



      }
}