// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";



class Document extends JsonScheme {

  
  Document(super.rawData);
   
  static Map get defaultData {
    return {"@type":"document","file_id":""};
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


  
  static Document create({

    String special_type = "document",
    String? file_id,
})  {
    // Document document = Document({
Map document_data_create_json = {
  
      "@type": special_type,
      "file_id": file_id,


};


          document_data_create_json.removeWhere((key, value) => value == null);
Document document_data_create = Document(document_data_create_json);

return document_data_create;



      }
}