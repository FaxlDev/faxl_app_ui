// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";



class Voice extends JsonScheme {

  
  Voice(super.rawData);
   
  static Map get defaultData {
    return {"@type":"voice","file_id":""};
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


  
  static Voice create({

    String special_type = "voice",
    String? file_id,
})  {
    // Voice voice = Voice({
Map voice_data_create_json = {
  
      "@type": special_type,
      "file_id": file_id,


};


          voice_data_create_json.removeWhere((key, value) => value == null);
Voice voice_data_create = Voice(voice_data_create_json);

return voice_data_create;



      }
}