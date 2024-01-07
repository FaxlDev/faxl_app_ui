// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";



class InlineKeyboardData extends JsonScheme {

  
  InlineKeyboardData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"inlineKeyboardData","text":"","url":"","callback_data":""};
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


  
  String? get text {
    try {
      if (rawData["text"] is String == false){
        return null;
      }
      return rawData["text"] as String;
    } catch (e) {
      return null;
    }
  }


  
  String? get url {
    try {
      if (rawData["url"] is String == false){
        return null;
      }
      return rawData["url"] as String;
    } catch (e) {
      return null;
    }
  }


  
  String? get callback_data {
    try {
      if (rawData["callback_data"] is String == false){
        return null;
      }
      return rawData["callback_data"] as String;
    } catch (e) {
      return null;
    }
  }


  
  static InlineKeyboardData create({

    String special_type = "inlineKeyboardData",
    String? text,
    String? url,
    String? callback_data,
})  {
    // InlineKeyboardData inlineKeyboardData = InlineKeyboardData({
Map inlineKeyboardData_data_create_json = {
  
      "@type": special_type,
      "text": text,
      "url": url,
      "callback_data": callback_data,


};


          inlineKeyboardData_data_create_json.removeWhere((key, value) => value == null);
InlineKeyboardData inlineKeyboardData_data_create = InlineKeyboardData(inlineKeyboardData_data_create_json);

return inlineKeyboardData_data_create;



      }
}