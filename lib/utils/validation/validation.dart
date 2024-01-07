// import 'package:/.dart';

// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:faxl_lib/faxl_lib.dart';

enum ValidationDataType {
  token_bot,
  username,
  password,
  telegram_user_id,
}

class ValidationData {
  bool is_valid = false;
  String? message;
  ValidationData({
    required this.is_valid,
  });
}

ValidationData validation({
  required String? data,
  required ValidationDataType validationDataType,
}) {
  ValidationData validationData = ValidationData(
    is_valid: false,
  );
  if (ValidationDataType.telegram_user_id == validationDataType) {
    if (data != null) {
      if (!RegExp(r"^([0-9]+)$", caseSensitive: false).hashData(data)) {
        validationData.message = "Format Salah";
      } else {
        validationData.is_valid = true;
      }
    } else {
      validationData.message = "Telegram User Id Harus ada";
      return validationData;
    }
  }

  if (ValidationDataType.token_bot == validationDataType) {
    if (data != null) {
      if (!RegExp(r"^(([0-9]+)(:[a-z0-9_\-]+)?)$", caseSensitive: false).hashData(data)) {
        validationData.message = "Format Token Bot Salah";
      } else {
        validationData.is_valid = true;
      }
    } else {
      validationData.message = "Phone Number harus ada";
      return validationData;
    }
  }

  if (ValidationDataType.username == validationDataType) {
    if (data == null) {
      validationData.message = "Username Harus Ada";
      return validationData;
    }

    if (!RegExp(r"^([a-z]+)$", caseSensitive: false).hasMatch(data)) {
      validationData.message = "Format Username Salah";
      return validationData;
    }
    if (data.length < 5) {
      validationData.message = "Panjang Username Minimal 5 Character";
      return validationData;
    }
    if (data.length > 25) {
      validationData.message = "Panjang Username Maximal 25 Character";
      return validationData;
    }
    validationData.is_valid = true;
    return validationData;
  }
  if (ValidationDataType.password == validationDataType) {
    if (data == null) {
      validationData.is_valid = false;

      validationData.message = "Password Harus Ada";
      return validationData;
    }

    if (data.length < 8) {
      validationData.is_valid = false;

      validationData.message = "Password $data Terlalu Pendek Min 8 Characters";
      return validationData;
    }
    if (data.length > 100) {
      validationData.is_valid = false;
      validationData.message = "Password $data Terlalu Panjang Max 100 Characters";

      return validationData;
    }
    if (RegExp(r"A([ ]+)kosapeo([ ]+)\.\.13([ ]+)\.1([ ]+)-_", caseSensitive: false).hasMatch(data)) {
      validationData.is_valid = false;

      validationData.message = "Password $data Tidak boleh sama dengan contoh";

      return validationData;
    }
    if (data.isNotEmpty) {
      validationData.is_valid = false;

      List<RegExp> regExps = [
        RegExp("([A-Z]+)"),
        RegExp("([a-z]+)"),
        RegExp("([0-9]+)"),
        RegExp("([ ]+)"),
        RegExp("(.)"),
      ];
      int count_data_password = 0;
      for (var index_password_regex = 0; index_password_regex < regExps.length; index_password_regex++) {
        RegExp regExp = regExps[index_password_regex];

        if (regExp.hasMatch(data)) {
          count_data_password += 1;
        } else {
          count_data_password -= 1;
        }
      }

      if ((regExps.length == count_data_password) == false) {
        validationData.is_valid = false;

        validationData.message = "Password Harus ada Chars Besar Kecil, Symbol,Space, Angka";
        return validationData;
      }
    }

    validationData.is_valid = true;
    return validationData;
  }

  return validationData;
}
