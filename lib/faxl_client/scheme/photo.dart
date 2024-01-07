// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";



class Photo extends JsonScheme {

  
  Photo(super.rawData);
   
  static Map get defaultData {
    return {"@type":"photo","file_id":""};
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


  
  static Photo create({

    String special_type = "photo",
    String? file_id,
})  {
    // Photo photo = Photo({
Map photo_data_create_json = {
  
      "@type": special_type,
      "file_id": file_id,


};


          photo_data_create_json.removeWhere((key, value) => value == null);
Photo photo_data_create = Photo(photo_data_create_json);

return photo_data_create;



      }
}