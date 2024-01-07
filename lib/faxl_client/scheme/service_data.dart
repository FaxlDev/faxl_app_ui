// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";



class ServiceData extends JsonScheme {

  
  ServiceData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"serviceData","id":"clone_bot_userbot_app","title":"Clone Bot, Userbot, App","description":"Hai kamu mau punya bot / userbot / hal apapun itu yang?"};
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


  
  static ServiceData create({

    String special_type = "serviceData",
    String? id,
    String? title,
    String? description,
})  {
    // ServiceData serviceData = ServiceData({
Map serviceData_data_create_json = {
  
      "@type": special_type,
      "id": id,
      "title": title,
      "description": description,


};


          serviceData_data_create_json.removeWhere((key, value) => value == null);
ServiceData serviceData_data_create = ServiceData(serviceData_data_create_json);

return serviceData_data_create;



      }
}