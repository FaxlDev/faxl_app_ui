// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

import "user.dart";
import "chat.dart";
import "content_message.dart";


class Message extends JsonScheme {

  
  Message(super.rawData);
   
  static Map get defaultData {
    return {"@type":"message","id":0,"from":{"@type":"user","id":0,"profile_picture":"","first_name":"","member_count":0,"last_name":"","status":"","username":"","type":""},"chat":{"@type":"chat","id":0,"first_name":"","profile_picture":"","title":"","last_name":"","status":"","member_count":0,"username":"","type":""},"is_outgoing":false,"date":0,"reply_to_message_id":0,"content":{"@type":"contentMessage","type":"text","document":{"@type":"document","file_id":""},"audio":{"@type":"audio","file_id":""},"video":{"@type":"video","file_id":""},"voice":{"@type":"voice","file_id":""},"photo":{"@type":"photo","file_id":""},"text":"","caption":""}};
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


  
  User get from {
    try {
      if (rawData["from"] is Map == false){
        return User({}); 
      }
      return User(rawData["from"] as Map);
    } catch (e) {  
      return User({}); 
    }
  }


  
  Chat get chat {
    try {
      if (rawData["chat"] is Map == false){
        return Chat({}); 
      }
      return Chat(rawData["chat"] as Map);
    } catch (e) {  
      return Chat({}); 
    }
  }


  
  bool? get is_outgoing {
    try {
      if (rawData["is_outgoing"] is bool == false){
        return null;
      }
      return rawData["is_outgoing"] as bool;
    } catch (e) {
      return null;
    }
  }


  
  num? get date {
    try {
      if (rawData["date"] is num == false){
        return null;
      }
      return rawData["date"] as num;
    } catch (e) {
      return null;
    }
  }


  
  num? get reply_to_message_id {
    try {
      if (rawData["reply_to_message_id"] is num == false){
        return null;
      }
      return rawData["reply_to_message_id"] as num;
    } catch (e) {
      return null;
    }
  }


  
  ContentMessage get content {
    try {
      if (rawData["content"] is Map == false){
        return ContentMessage({}); 
      }
      return ContentMessage(rawData["content"] as Map);
    } catch (e) {  
      return ContentMessage({}); 
    }
  }


  
  static Message create({

    String special_type = "message",
    num? id,
      User? from,
      Chat? chat,
    bool? is_outgoing,
    num? date,
    num? reply_to_message_id,
      ContentMessage? content,
})  {
    // Message message = Message({
Map message_data_create_json = {
  
      "@type": special_type,
      "id": id,
      "from": (from != null)?from.toJson(): null,
      "chat": (chat != null)?chat.toJson(): null,
      "is_outgoing": is_outgoing,
      "date": date,
      "reply_to_message_id": reply_to_message_id,
      "content": (content != null)?content.toJson(): null,


};


          message_data_create_json.removeWhere((key, value) => value == null);
Message message_data_create = Message(message_data_create_json);

return message_data_create;



      }
}