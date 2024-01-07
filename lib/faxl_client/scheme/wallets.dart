// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

import "wallet.dart";


class Wallets extends JsonScheme {

  
  Wallets(super.rawData);
   
  static Map get defaultData {
    return {"@type":"wallets","total_count":0,"wallets":[{"@type":"wallet","title":"","wallet_id":"","balance":0,"type":""}],"@date":0,"@expire_date":0,"@extra":""};
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

  
  List<Wallet> get wallets {
    try {
      if (rawData["wallets"] is List == false){
        return [];
      }
      return (rawData["wallets"] as List).map((e) => Wallet(e as Map)).toList().cast<Wallet>();
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


  
  static Wallets create({

    String special_type = "wallets",
    num? total_count,
      List<Wallet>? wallets,
    num special_date = 0,
    num special_expire_date = 0,
    String special_extra = "",
})  {
    // Wallets wallets = Wallets({
Map wallets_data_create_json = {
  
      "@type": special_type,
      "total_count": total_count,
      "wallets": (wallets != null)? wallets.toJson(): null,
      "@date": special_date,
      "@expire_date": special_expire_date,
      "@extra": special_extra,


};


          wallets_data_create_json.removeWhere((key, value) => value == null);
Wallets wallets_data_create = Wallets(wallets_data_create_json);

return wallets_data_create;



      }
}