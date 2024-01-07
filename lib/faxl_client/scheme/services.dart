// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

import "service_data.dart";


class Services extends JsonScheme {

  
  Services(super.rawData);
   
  static Map get defaultData {
    return {"@type":"services","total_count":0,"services":[{"@type":"serviceData","id":"clone_bot_userbot_app","title":"Clone Bot, Userbot, App","description":"Hai kamu mau punya bot / userbot / hal apapun itu yang?"}],"@date":0,"@expire_date":0,"@extra":""};
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


  
  num? get total_count {
    try {
      if (rawData["total_count"] is num == false){
        return null;
      }
      return rawData["total_count"] as num;
    } catch (e) {
      return null;
    }
  }

  
  List<ServiceData> get services {
    try {
      if (rawData["services"] is List == false){
        return [];
      }
      return (rawData["services"] as List).map((e) => ServiceData(e as Map)).toList().cast<ServiceData>();
    } catch (e) {
      return [];
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


  
  static Services create({

    String special_type = "services",
    num? total_count,
      List<ServiceData>? services,
    num special_date = 0,
    num special_expire_date = 0,
    String special_extra = "",
})  {
    // Services services = Services({
Map services_data_create_json = {
  
      "@type": special_type,
      "total_count": total_count,
      "services": (services != null)? services.toJson(): null,
      "@date": special_date,
      "@expire_date": special_expire_date,
      "@extra": special_extra,


};


          services_data_create_json.removeWhere((key, value) => value == null);
Services services_data_create = Services(services_data_create_json);

return services_data_create;



      }
}