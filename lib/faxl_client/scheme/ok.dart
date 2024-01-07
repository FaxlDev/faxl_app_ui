// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";



class Ok extends JsonScheme {

  
  Ok(super.rawData);
   
  static Map get defaultData {
    return {"@type":"ok","@date":0,"@expire_date":0,"@extra":""};
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


  
  static Ok create({

    String special_type = "ok",
    num special_date = 0,
    num special_expire_date = 0,
    String special_extra = "",
})  {
    // Ok ok = Ok({
Map ok_data_create_json = {
  
      "@type": special_type,
      "@date": special_date,
      "@expire_date": special_expire_date,
      "@extra": special_extra,


};


          ok_data_create_json.removeWhere((key, value) => value == null);
Ok ok_data_create = Ok(ok_data_create_json);

return ok_data_create;



      }
}