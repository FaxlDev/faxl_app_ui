// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

import "answer_data.dart";
import "reply_markup.dart";


class AccountVerificationTask extends JsonScheme {

  
  AccountVerificationTask(super.rawData);
   
  static Map get defaultData {
    return {"@type":"accountVerificationTask","id":"pay_activation_account","title":"Bayar ","message":"","is_done":false,"answer_accept_type":"photo","answer":{"@type":"answerData"},"reply_markup":{"@type":"replyMarkup","inline_keyboard":[[{"@type":"inlineKeyboardData","text":"","url":"","callback_data":""}]]}};
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


  
  String? get id {
    try {
      if (rawData["id"] is String == false){
        return null;
      }
      return rawData["id"] as String;
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


  
  String? get message {
    try {
      if (rawData["message"] is String == false){
        return null;
      }
      return rawData["message"] as String;
    } catch (e) {
      return null;
    }
  }


  
  bool? get is_done {
    try {
      if (rawData["is_done"] is bool == false){
        return null;
      }
      return rawData["is_done"] as bool;
    } catch (e) {
      return null;
    }
  }


  
  String? get answer_accept_type {
    try {
      if (rawData["answer_accept_type"] is String == false){
        return null;
      }
      return rawData["answer_accept_type"] as String;
    } catch (e) {
      return null;
    }
  }


  
  AnswerData get answer {
    try {
      if (rawData["answer"] is Map == false){
        return AnswerData({}); 
      }
      return AnswerData(rawData["answer"] as Map);
    } catch (e) {  
      return AnswerData({}); 
    }
  }


  
  ReplyMarkup get reply_markup {
    try {
      if (rawData["reply_markup"] is Map == false){
        return ReplyMarkup({}); 
      }
      return ReplyMarkup(rawData["reply_markup"] as Map);
    } catch (e) {  
      return ReplyMarkup({}); 
    }
  }


  
  static AccountVerificationTask create({

    String special_type = "accountVerificationTask",
    String? id,
    String? title,
    String? message,
    bool? is_done,
    String? answer_accept_type,
      AnswerData? answer,
      ReplyMarkup? reply_markup,
})  {
    // AccountVerificationTask accountVerificationTask = AccountVerificationTask({
Map accountVerificationTask_data_create_json = {
  
      "@type": special_type,
      "id": id,
      "title": title,
      "message": message,
      "is_done": is_done,
      "answer_accept_type": answer_accept_type,
      "answer": (answer != null)?answer.toJson(): null,
      "reply_markup": (reply_markup != null)?reply_markup.toJson(): null,


};


          accountVerificationTask_data_create_json.removeWhere((key, value) => value == null);
AccountVerificationTask accountVerificationTask_data_create = AccountVerificationTask(accountVerificationTask_data_create_json);

return accountVerificationTask_data_create;



      }
}