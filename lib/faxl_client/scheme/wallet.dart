// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";



class Wallet extends JsonScheme {

  
  Wallet(super.rawData);
   
  static Map get defaultData {
    return {"@type":"wallet","title":"","wallet_id":"","balance":0,"type":""};
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


  
  String? get wallet_id {
    try {
      if (rawData["wallet_id"] is String == false){
        return null;
      }
      return rawData["wallet_id"] as String;
    } catch (e) {
      return null;
    }
  }


  
  num? get balance {
    try {
      if (rawData["balance"] is num == false){
        return null;
      }
      return rawData["balance"] as num;
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


  
  static Wallet create({

    String special_type = "wallet",
    String? title,
    String? wallet_id,
    num? balance,
    String? type,
})  {
    // Wallet wallet = Wallet({
Map wallet_data_create_json = {
  
      "@type": special_type,
      "title": title,
      "wallet_id": wallet_id,
      "balance": balance,
      "type": type,


};


          wallet_data_create_json.removeWhere((key, value) => value == null);
Wallet wallet_data_create = Wallet(wallet_data_create_json);

return wallet_data_create;



      }
}