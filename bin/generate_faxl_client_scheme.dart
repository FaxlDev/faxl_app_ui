// ignore_for_file: avoid_print

import 'package:faxl_lib/json_to_script_dart/json_to_script.dart';
// import 'package:/.dart';
import 'package:universal_io/io.dart';
import "package:path/path.dart" as path;

void main(List<String> arguments) async {
  print("START");
  List<Map<String, dynamic>> datas = [
    {
      "@type": "ok",
    },
    {
      "@type": "error",
      "message": "",
      "description": "",
    },
    {
      "@type": "account",
      "id": 1,
      "first_name": "",
      "last_name": "",
      "username": "",
      "type": "",
      "bio": "",
      "descrition": "",
      "created_date": 0,
      "is_verified": false,
      "faxl_user_id": 0,
      "owner_user_id": 0,
    },
    {
      "@type": "chats",
      "total_count": 0,
      "chats": [
        {
          "@type": "chat",
          "id": -100,
          "title": "",
          "first_name": "",
          "last_name": "",
          "username": "",
          "type": "",
          "status": "",
          "member_count": 0,
          "bio": "",
          "profile_picture": "",
          "description": "",
          "owner_user_id": 0,
          "last_message": {
            "@type": "message",
            "id": 0,
            "from": {
              "@type": "user",
              "id": 0,
              "profile_picture": "",
              "first_name": "",
              "member_count": 0,
              "last_name": "",
              "status": "",
              "username": "",
              "type": "",
            },
            "chat": {
              "@type": "chat",
              "id": 0,
              "first_name": "",
              "profile_picture": "",
              "title": "",
              "last_name": "",
              "status": "","member_count": 0,
              "username": "",
              "type": "",
            },
            "is_outgoing": false,
            "date": 0,
            "reply_to_message_id": 0,
            "content": {
              "@type": "contentMessage",
              "type": "text",
              "document": {
                "file_id": "",
              },
              "audio": {
                "file_id": "",
              },
              "video": {
                "file_id": "",
              },
              "voice": {
                "file_id": "",
              },
              "photo": {
                "file_id": "",
              },
              "text": "",
              "caption": "",
            }
          }
        },
      ],
    },
    {
      "@type": "session",
      "client_user_id": 0,
      "client_token": "",
      "created_date": 0,
      "last_update_date": 0,
      "program_date": 0,
      "app_id": "",
      "@extra": "LnAoT7MBAx",
      "@date": 1702528162890,
      "@expire_date": 1702528222890,
      "is_default": false,
    },
    {
      "@type": "accountVerificationTasks",
      "total_count": 0,
      "task": [
        {
          "@type": "accountVerificationTask",
          "id": "pay_activation_account",
          "title": "Bayar ",
          "message": """

"""
              .trim(),
          "is_done": false,
          "answer_accept_type": "photo",
          "answer": {
            "@type": "answerData",
          },
          "reply_markup": {
            "@type": "replyMarkup",
            "inline_keyboard": [
              [
                {
                  "@type": "inlineKeyboardData",
                  "text": "",
                  "url": "",
                  "callback_data": "",
                }
              ]
            ]
          }
        },
      ],
    },
    {
      "@type": "wallets",
      "total_count": 0,
      "wallets": [
        {
          "@type": "wallet",
          "title": "",
          "wallet_id": "",
          "balance": num.parse("0"),
          "type": "",
        },
      ]
    },
  ];

  for (var i = 0; i < datas.length; i++) {
    datas[i].addAll({
      "@date": 0,
      "@expire_date": 0,
      "@extra": "",
    });
  }

  await jsonToScripts(
    datas,
    directory: Directory(
      path.join(
        Directory.current.path,
        "lib",
        "faxl_client",
        "scheme",
      ),
    ),
  );
}
