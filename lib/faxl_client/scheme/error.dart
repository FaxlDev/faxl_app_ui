// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";



class Error extends JsonScheme {

  
  Error(super.rawData);
   
  static Map get defaultData {
    return {"@type":"error","message":"","description":"","@date":0,"@expire_date":0,"@extra":""};
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


  
  String? get message {
    try {
      if (rawData["message"] is String == false){
        return null;
      }
      return rawData["message"] as String;
    } catch (e) {
      return null;
    }
  }


  
  String? get description {
    try {
      if (rawData["description"] is String == false){
        return null;
      }
      return rawData["description"] as String;
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


  
  static Error create({

    String special_type = "error",
    String? message,
    String? description,
    num special_date = 0,
    num special_expire_date = 0,
    String special_extra = "",
})  {
    // Error error = Error({
Map error_data_create_json = {
  
      "@type": special_type,
      "message": message,
      "description": description,
      "@date": special_date,
      "@expire_date": special_expire_date,
      "@extra": special_extra,


};


          error_data_create_json.removeWhere((key, value) => value == null);
Error error_data_create = Error(error_data_create_json);

return error_data_create;



      }
}