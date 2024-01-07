// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";



class Audio extends JsonScheme {

  
  Audio(super.rawData);
   
  static Map get defaultData {
    return {"@type":"audio","file_id":""};
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


  
  String? get file_id {
    try {
      if (rawData["file_id"] is String == false){
        return null;
      }
      return rawData["file_id"] as String;
    } catch (e) {
      return null;
    }
  }


  
  static Audio create({

    String special_type = "audio",
    String? file_id,
})  {
    // Audio audio = Audio({
Map audio_data_create_json = {
  
      "@type": special_type,
      "file_id": file_id,


};


          audio_data_create_json.removeWhere((key, value) => value == null);
Audio audio_data_create = Audio(audio_data_create_json);

return audio_data_create;



      }
}