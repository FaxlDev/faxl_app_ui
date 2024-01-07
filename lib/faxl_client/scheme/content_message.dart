// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

import "document.dart";
import "audio.dart";
import "video.dart";
import "voice.dart";
import "photo.dart";


class ContentMessage extends JsonScheme {

  
  ContentMessage(super.rawData);
   
  static Map get defaultData {
    return {"@type":"contentMessage","type":"text","document":{"@type":"document","file_id":""},"audio":{"@type":"audio","file_id":""},"video":{"@type":"video","file_id":""},"voice":{"@type":"voice","file_id":""},"photo":{"@type":"photo","file_id":""},"text":"","caption":""};
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


  
  Document get document {
    try {
      if (rawData["document"] is Map == false){
        return Document({}); 
      }
      return Document(rawData["document"] as Map);
    } catch (e) {  
      return Document({}); 
    }
  }


  
  Audio get audio {
    try {
      if (rawData["audio"] is Map == false){
        return Audio({}); 
      }
      return Audio(rawData["audio"] as Map);
    } catch (e) {  
      return Audio({}); 
    }
  }


  
  Video get video {
    try {
      if (rawData["video"] is Map == false){
        return Video({}); 
      }
      return Video(rawData["video"] as Map);
    } catch (e) {  
      return Video({}); 
    }
  }


  
  Voice get voice {
    try {
      if (rawData["voice"] is Map == false){
        return Voice({}); 
      }
      return Voice(rawData["voice"] as Map);
    } catch (e) {  
      return Voice({}); 
    }
  }


  
  Photo get photo {
    try {
      if (rawData["photo"] is Map == false){
        return Photo({}); 
      }
      return Photo(rawData["photo"] as Map);
    } catch (e) {  
      return Photo({}); 
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


  
  String? get caption {
    try {
      if (rawData["caption"] is String == false){
        return null;
      }
      return rawData["caption"] as String;
    } catch (e) {
      return null;
    }
  }


  
  static ContentMessage create({

    String special_type = "contentMessage",
    String? type,
      Document? document,
      Audio? audio,
      Video? video,
      Voice? voice,
      Photo? photo,
    String? text,
    String? caption,
})  {
    // ContentMessage contentMessage = ContentMessage({
Map contentMessage_data_create_json = {
  
      "@type": special_type,
      "type": type,
      "document": (document != null)?document.toJson(): null,
      "audio": (audio != null)?audio.toJson(): null,
      "video": (video != null)?video.toJson(): null,
      "voice": (voice != null)?voice.toJson(): null,
      "photo": (photo != null)?photo.toJson(): null,
      "text": text,
      "caption": caption,


};


          contentMessage_data_create_json.removeWhere((key, value) => value == null);
ContentMessage contentMessage_data_create = ContentMessage(contentMessage_data_create_json);

return contentMessage_data_create;



      }
}