// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

import "inline_keyboard_data.dart";


class ReplyMarkup extends JsonScheme {

  
  ReplyMarkup(super.rawData);
   
  static Map get defaultData {
    return {"@type":"replyMarkup","inline_keyboard":[[{"@type":"inlineKeyboardData","text":"","url":"","callback_data":""}]]};
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

  
List<List<InlineKeyboardData>> get inline_keyboard {
    try {
      if (rawData["inline_keyboard"] is List == false){
        return [];
      }
      return ((rawData["inline_keyboard"] as List).cast<List>()).map((e) => e.map((e) => InlineKeyboardData(e as Map)).toList().cast<InlineKeyboardData>()).toList().cast<List<InlineKeyboardData>>();
    } catch (e) {
      return [];
    }
  }


  
  static ReplyMarkup create({

    String special_type = "replyMarkup",
      List<List<InlineKeyboardData>>? inline_keyboard,
})  {
    // ReplyMarkup replyMarkup = ReplyMarkup({
Map replyMarkup_data_create_json = {
  
      "@type": special_type,
      "inline_keyboard": (inline_keyboard != null)? inline_keyboard.map((res) => res.map((e) => e.toJson()).toList().cast<Map>()).toList().cast<List<Map>>(): null,


};


          replyMarkup_data_create_json.removeWhere((key, value) => value == null);
ReplyMarkup replyMarkup_data_create = ReplyMarkup(replyMarkup_data_create_json);

return replyMarkup_data_create;



      }
}