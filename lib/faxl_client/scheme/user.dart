// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";



class User extends JsonScheme {

  
  User(super.rawData);
   
  static Map get defaultData {
    return {"@type":"user","id":0,"profile_picture":"","first_name":"","member_count":0,"last_name":"","status":"","username":"","type":""};
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


  
  String? get profile_picture {
    try {
      if (rawData["profile_picture"] is String == false){
        return null;
      }
      return rawData["profile_picture"] as String;
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


  
  num? get member_count {
    try {
      if (rawData["member_count"] is num == false){
        return null;
      }
      return rawData["member_count"] as num;
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


  
  String? get status {
    try {
      if (rawData["status"] is String == false){
        return null;
      }
      return rawData["status"] as String;
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


  
  static User create({

    String special_type = "user",
    num? id,
    String? profile_picture,
    String? first_name,
    num? member_count,
    String? last_name,
    String? status,
    String? username,
    String? type,
})  {
    // User user = User({
Map user_data_create_json = {
  
      "@type": special_type,
      "id": id,
      "profile_picture": profile_picture,
      "first_name": first_name,
      "member_count": member_count,
      "last_name": last_name,
      "status": status,
      "username": username,
      "type": type,


};


          user_data_create_json.removeWhere((key, value) => value == null);
User user_data_create = User(user_data_create_json);

return user_data_create;



      }
}