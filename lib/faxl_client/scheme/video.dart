// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";



class Video extends JsonScheme {

  
  Video(super.rawData);
   
  static Map get defaultData {
    return {"@type":"video","file_id":""};
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


  
  static Video create({

    String special_type = "video",
    String? file_id,
})  {
    // Video video = Video({
Map video_data_create_json = {
  
      "@type": special_type,
      "file_id": file_id,


};


          video_data_create_json.removeWhere((key, value) => value == null);
Video video_data_create = Video(video_data_create_json);

return video_data_create;



      }
}