// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

import "account_verification_task.dart";


class AccountVerificationTasks extends JsonScheme {

  
  AccountVerificationTasks(super.rawData);
   
  static Map get defaultData {
    return {"@type":"accountVerificationTasks","total_count":0,"task":[{"@type":"accountVerificationTask","id":"pay_activation_account","title":"Bayar ","message":"","is_done":false,"answer_accept_type":"photo","answer":{"@type":"answerData"},"reply_markup":{"@type":"replyMarkup","inline_keyboard":[[{"@type":"inlineKeyboardData","text":"","url":"","callback_data":""}]]}}],"@date":0,"@expire_date":0,"@extra":""};
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


  
  num? get total_count {
    try {
      if (rawData["total_count"] is num == false){
        return null;
      }
      return rawData["total_count"] as num;
    } catch (e) {
      return null;
    }
  }

  
  List<AccountVerificationTask> get task {
    try {
      if (rawData["task"] is List == false){
        return [];
      }
      return (rawData["task"] as List).map((e) => AccountVerificationTask(e as Map)).toList().cast<AccountVerificationTask>();
    } catch (e) {
      return [];
    }
  }


  
  num? get special_date {
    try {
      if (rawData["@date"] is num == false){
        return null;
      }
      return rawData["@date"] as num;
    } catch (e) {
      return null;
    }
  }


  
  num? get special_expire_date {
    try {
      if (rawData["@expire_date"] is num == false){
        return null;
      }
      return rawData["@expire_date"] as num;
    } catch (e) {
      return null;
    }
  }


  
  String? get special_extra {
    try {
      if (rawData["@extra"] is String == false){
        return null;
      }
      return rawData["@extra"] as String;
    } catch (e) {
      return null;
    }
  }


  
  static AccountVerificationTasks create({

    String special_type = "accountVerificationTasks",
    num? total_count,
      List<AccountVerificationTask>? task,
    num special_date = 0,
    num special_expire_date = 0,
    String special_extra = "",
})  {
    // AccountVerificationTasks accountVerificationTasks = AccountVerificationTasks({
Map accountVerificationTasks_data_create_json = {
  
      "@type": special_type,
      "total_count": total_count,
      "task": (task != null)? task.toJson(): null,
      "@date": special_date,
      "@expire_date": special_expire_date,
      "@extra": special_extra,


};


          accountVerificationTasks_data_create_json.removeWhere((key, value) => value == null);
AccountVerificationTasks accountVerificationTasks_data_create = AccountVerificationTasks(accountVerificationTasks_data_create_json);

return accountVerificationTasks_data_create;



      }
}