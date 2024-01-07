// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";



class AnswerData extends JsonScheme {

  
  AnswerData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"answerData"};
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


  
  static AnswerData create({

    String special_type = "answerData",
})  {
    // AnswerData answerData = AnswerData({
Map answerData_data_create_json = {
  
      "@type": special_type,


};


          answerData_data_create_json.removeWhere((key, value) => value == null);
AnswerData answerData_data_create = AnswerData(answerData_data_create_json);

return answerData_data_create;



      }
}