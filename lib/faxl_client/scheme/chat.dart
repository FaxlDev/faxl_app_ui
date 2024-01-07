// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

import "message.dart";


class Chat extends JsonScheme {

  
  Chat(super.rawData);
   
  static Map get defaultData {
    return {"@type":"chat","id":0,"title":"","first_name":"","last_name":"","username":"","type":"","status":"","member_count":0,"bio":"","profile_picture":"","description":"","owner_user_id":0,"last_message":{"@type":"message","id":0,"from":{"@type":"user","id":0,"profile_picture":"","first_name":"","member_count":0,"last_name":"","status":"","username":"","type":""},"chat":{"@type":"chat","id":0,"first_name":"","profile_picture":"","title":"","last_name":"","status":"","member_count":0,"username":"","type":""},"is_outgoing":false,"date":0,"reply_to_message_id":0,"content":{"@type":"contentMessage","type":"text","document":{"@type":"document","file_id":""},"audio":{"@type":"audio","file_id":""},"video":{"@type":"video","file_id":""},"voice":{"@type":"voice","file_id":""},"photo":{"@type":"photo","file_id":""},"text":"","caption":""}}};
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


  
  num? get id {
    try {
      if (rawData["id"] is num == false){
        return null;
      }
      return rawData["id"] as num;
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


  
  String? get first_name {
    try {
      if (rawData["first_name"] is String == false){
        return null;
      }
      return rawData["first_name"] as String;
    } catch (e) {
      return null;
    }
  }


  
  String? get last_name {
    try {
      if (rawData["last_name"] is String == false){
        return null;
      }
      return rawData["last_name"] as String;
    } catch (e) {
      return null;
    }
  }


  
  String? get username {
    try {
      if (rawData["username"] is String == false){
        return null;
      }
      return rawData["username"] as String;
    } catch (e) {
      return null;
    }
  }


  
  String? get type {
    try {
      if (rawData["type"] is String == false){
        return null;
      }
      return rawData["type"] as String;
    } catch (e) {
      return null;
    }
  }


  
  String? get status {
    try {
      if (rawData["status"] is String == false){
        return null;
      }
      return rawData["status"] as String;
    } catch (e) {
      return null;
    }
  }


  
  num? get member_count {
    try {
      if (rawData["member_count"] is num == false){
        return null;
      }
      return rawData["member_count"] as num;
    } catch (e) {
      return null;
    }
  }


  
  String? get bio {
    try {
      if (rawData["bio"] is String == false){
        return null;
      }
      return rawData["bio"] as String;
    } catch (e) {
      return null;
    }
  }


  
  String? get profile_picture {
    try {
      if (rawData["profile_picture"] is String == false){
        return null;
      }
      return rawData["profile_picture"] as String;
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


  
  num? get owner_user_id {
    try {
      if (rawData["owner_user_id"] is num == false){
        return null;
      }
      return rawData["owner_user_id"] as num;
    } catch (e) {
      return null;
    }
  }


  
  Message get last_message {
    try {
      if (rawData["last_message"] is Map == false){
        return Message({}); 
      }
      return Message(rawData["last_message"] as Map);
    } catch (e) {  
      return Message({}); 
    }
  }


  
  static Chat create({

    String special_type = "chat",
    num? id,
    String? title,
    String? first_name,
    String? last_name,
    String? username,
    String? type,
    String? status,
    num? member_count,
    String? bio,
    String? profile_picture,
    String? description,
    num? owner_user_id,
      Message? last_message,
})  {
    // Chat chat = Chat({
Map chat_data_create_json = {
  
      "@type": special_type,
      "id": id,
      "title": title,
      "first_name": first_name,
      "last_name": last_name,
      "username": username,
      "type": type,
      "status": status,
      "member_count": member_count,
      "bio": bio,
      "profile_picture": profile_picture,
      "description": description,
      "owner_user_id": owner_user_id,
      "last_message": (last_message != null)?last_message.toJson(): null,


};


          chat_data_create_json.removeWhere((key, value) => value == null);
Chat chat_data_create = Chat(chat_data_create_json);

return chat_data_create;



      }
}