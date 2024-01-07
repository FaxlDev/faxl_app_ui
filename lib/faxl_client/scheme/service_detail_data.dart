// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";



class ServiceDetailData extends JsonScheme {

  
  ServiceDetailData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"serviceDetailData","id":"clone_bot_userbot_app","title":"Clone Bot, Userbot, App","description":"Hai kamu mau punya bot / userbot / hal apapun itu yang?","@date":0,"@expire_date":0,"@extra":""};
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


  
  String? get id {
    try {
      if (rawData["id"] is String == false){
        return null;
      }
      return rawData["id"] as String;
    } catch (e) {
      return null;
    }
  }


  
  String? get title {
    try {
      if (rawData["title"] is String == false){
        return null;
      }
      return rawData["title"] as String;
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


  
  static ServiceDetailData create({

    String special_type = "serviceDetailData",
    String? id,
    String? title,
    String? description,
    num special_date = 0,
    num special_expire_date = 0,
    String special_extra = "",
})  {
    // ServiceDetailData serviceDetailData = ServiceDetailData({
Map serviceDetailData_data_create_json = {
  
      "@type": special_type,
      "id": id,
      "title": title,
      "description": description,
      "@date": special_date,
      "@expire_date": special_expire_date,
      "@extra": special_extra,


};


          serviceDetailData_data_create_json.removeWhere((key, value) => value == null);
ServiceDetailData serviceDetailData_data_create = ServiceDetailData(serviceDetailData_data_create_json);

return serviceDetailData_data_create;



      }
}