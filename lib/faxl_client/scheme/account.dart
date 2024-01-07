// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";



class Account extends JsonScheme {

  
  Account(super.rawData);
   
  static Map get defaultData {
    return {"@type":"account","id":1,"first_name":"","last_name":"","username":"","type":"","bio":"","descrition":"","created_date":0,"is_verified":false,"faxl_user_id":0,"owner_user_id":0,"@date":0,"@expire_date":0,"@extra":""};
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


  
  String? get first_name {
    try {
      if (rawData["first_name"] is String == false){
        return null;
      }
      return rawData["first_name"] as String;
    } catch (e) {
      return null;
    }
  }


  
  String? get last_name {
    try {
      if (rawData["last_name"] is String == false){
        return null;
      }
      return rawData["last_name"] as String;
    } catch (e) {
      return null;
    }
  }


  
  String? get username {
    try {
      if (rawData["username"] is String == false){
        return null;
      }
      return rawData["username"] as String;
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


  
  String? get bio {
    try {
      if (rawData["bio"] is String == false){
        return null;
      }
      return rawData["bio"] as String;
    } catch (e) {
      return null;
    }
  }


  
  String? get descrition {
    try {
      if (rawData["descrition"] is String == false){
        return null;
      }
      return rawData["descrition"] as String;
    } catch (e) {
      return null;
    }
  }


  
  num? get created_date {
    try {
      if (rawData["created_date"] is num == false){
        return null;
      }
      return rawData["created_date"] as num;
    } catch (e) {
      return null;
    }
  }


  
  bool? get is_verified {
    try {
      if (rawData["is_verified"] is bool == false){
        return null;
      }
      return rawData["is_verified"] as bool;
    } catch (e) {
      return null;
    }
  }


  
  num? get faxl_user_id {
    try {
      if (rawData["faxl_user_id"] is num == false){
        return null;
      }
      return rawData["faxl_user_id"] as num;
    } catch (e) {
      return null;
    }
  }


  
  num? get owner_user_id {
    try {
      if (rawData["owner_user_id"] is num == false){
        return null;
      }
      return rawData["owner_user_id"] as num;
    } catch (e) {
      return null;
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


  
  static Account create({

    String special_type = "account",
    num? id,
    String? first_name,
    String? last_name,
    String? username,
    String? type,
    String? bio,
    String? descrition,
    num? created_date,
    bool? is_verified,
    num? faxl_user_id,
    num? owner_user_id,
    num special_date = 0,
    num special_expire_date = 0,
    String special_extra = "",
})  {
    // Account account = Account({
Map account_data_create_json = {
  
      "@type": special_type,
      "id": id,
      "first_name": first_name,
      "last_name": last_name,
      "username": username,
      "type": type,
      "bio": bio,
      "descrition": descrition,
      "created_date": created_date,
      "is_verified": is_verified,
      "faxl_user_id": faxl_user_id,
      "owner_user_id": owner_user_id,
      "@date": special_date,
      "@expire_date": special_expire_date,
      "@extra": special_extra,


};


          account_data_create_json.removeWhere((key, value) => value == null);
Account account_data_create = Account(account_data_create_json);

return account_data_create;



      }
}