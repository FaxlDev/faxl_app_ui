// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

import "chat.dart";


class Chats extends JsonScheme {

  
  Chats(super.rawData);
   
  static Map get defaultData {
    return {"@type":"chats","total_count":0,"chats":[{"@type":"chat","id":-100,"title":"","first_name":"","last_name":"","username":"","type":"","status":"","member_count":0,"bio":"","profile_picture":"","description":"","owner_user_id":0,"last_message":{"@type":"message","id":0,"from":{"@type":"user","id":0,"profile_picture":"","first_name":"","member_count":0,"last_name":"","status":"","username":"","type":""},"chat":{"@type":"chat","id":0,"first_name":"","profile_picture":"","title":"","last_name":"","status":"","member_count":0,"username":"","type":""},"is_outgoing":false,"date":0,"reply_to_message_id":0,"content":{"@type":"contentMessage","type":"text","document":{"file_id":""},"audio":{"file_id":""},"video":{"file_id":""},"voice":{"file_id":""},"photo":{"file_id":""},"text":"","caption":""}}}],"@date":0,"@expire_date":0,"@extra":""};
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

  
  List<Chat> get chats {
    try {
      if (rawData["chats"] is List == false){
        return [];
      }
      return (rawData["chats"] as List).map((e) => Chat(e as Map)).toList().cast<Chat>();
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


  
  static Chats create({

    String special_type = "chats",
    num? total_count,
      List<Chat>? chats,
    num special_date = 0,
    num special_expire_date = 0,
    String special_extra = "",
})  {
    // Chats chats = Chats({
Map chats_data_create_json = {
  
      "@type": special_type,
      "total_count": total_count,
      "chats": (chats != null)? chats.toJson(): null,
      "@date": special_date,
      "@expire_date": special_expire_date,
      "@extra": special_extra,


};


          chats_data_create_json.removeWhere((key, value) => value == null);
Chats chats_data_create = Chats(chats_data_create_json);

return chats_data_create;



      }
}