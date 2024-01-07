// ignore_for_file: constant_identifier_names, prefer_const_constructors, use_build_context_synchronously, unused_local_variable, dead_code, implementation_imports, unnecessary_brace_in_string_interps, non_constant_identifier_names

import "package:cool_alert/cool_alert.dart";
import "package:faxl_app_ui/faxl_client/scheme/session.dart";
import "package:faxl_app_ui/page/screen/screen.dart";
import "package:faxl_app_ui/utils/validation/validation.dart";
import "package:faxl_app_ui/widget/animated_image_container.dart";
import "package:faxl_app_ui/widget/faxl_app_ui_client_flutter_stateful_widget.dart";
import "package:faxl_app_ui/widget/switch.dart";
import "package:faxl_lib/faxl_lib.dart";
import "package:faxl_lib_flutter/faxl_lib_flutter.dart";
import "package:flutter_hicons/flutter_hicons.dart";
import "package:http/http.dart";
import 'package:flutter/material.dart';

class SignPage extends FaxlAppUiAppStatefulWidget {
  const SignPage({
    super.key,
    required super.faxlClient,
  });

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> with TickerProviderStateMixin {
  List<String> sign_tabs = ["Sign In", "Sign Up", "Reset"];
  // SignType signType = SignType.sign_in;
  late TabController signTabController = TabController(
    length: sign_tabs.length,
    vsync: this,
  );
  final List<String> verify_tabs = [
    "Secret Word",
    "Payment",
    "Face",
  ];

  // TextEditingController telegram_user_id_text_editing_controller = TextEditingController();
  TextEditingController username_text_editing_controller = TextEditingController();
  TextEditingController password_faxl_text_editing_controller = TextEditingController();
  TextEditingController password_text_editing_controller = TextEditingController();
  TextEditingController password__text_editing_controller = TextEditingController();

  bool is_procces = false;

  bool is_show_password = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: context.height,
            minWidth: context.width,
            // maxHeight: context.height,
            // maxWidth: context.width,
          ),
          child: autoPageSignBody(),
        ),
      ),
    );
  }

  void handleAuth() {
    // context.navigator().pushReplacement(MaterialPageRoute(
    //   builder: (context) {
    //     return HomePage(
    //       faxlClientFlutter: widget.faxlClientFlutter,
    //     );
    //   },
    // ));
    // // return;
    // Future(() async {
    //   TelegramBotApi telegramBotApi = TelegramBotApi(tokenBot: textEditingController.text);
    //   try {
    //     await telegramBotApi.request("getMe");

    //     widget.appData.token_bot = textEditingController.text;
    //     setState(() {
    //       is_procces = false;
    //     });
    //     await widget.appData.runBots();
    //     context.navigator().pop();
    //     // context.navigator().pushReplacement(MaterialPageRoute(
    //     //   builder: (context) {

    //     //     return HomePage(faxlClientFlutter: widget.faxlClientFlutter);
    //     //   },
    //     // ));
    //   } catch (e) {
    //     setState(() {
    //       is_procces = false;
    //     });

    //     await CoolAlert.show(
    //       context: context,
    //       type: CoolAlertType.info,
    //       title: "Token Bot Salah",
    //       text: "Maaf Token bot mungkin telah di revoke silahkan membuat dengan benar di @botfather ya",
    //     );
    //   }
    // });
  }

  Widget autoPageSignBody() {
    return pageSignBody();
  }

  Widget pageSignBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: context.mediaQueryData.padding.top,
        ),
        Visibility(
          visible: context.navigator().canPop(),
          child: Row(
            children: [
              MaterialButton(
                minWidth: 0,
                onPressed: () async {
                  context.navigator().pop();
                },
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Icon(
                    Hicons.send_4_light_outline,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: context.height,
            minWidth: context.width,
            // maxHeight: context.height,
            // maxWidth: context.width,
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              Widget child = signInBody();
              if (signTabController.index == 1) {
                child = signUpBody();
              }
              if (signTabController.index == 2) {
                child = resetBody();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: AnimatedImageContainer(
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ThemeToggleSwitch(
                      faxlClient: widget.faxlClient,
                    ),
                  ),

                  // Container(
                  //   height: 150,
                  //   width: 150,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.all(Radius.circular(100)),
                  //     image: DecorationImage(
                  //       image: Image.asset(
                  //         "assets/icons/app.jpg",
                  //         fit: BoxFit.cover,
                  //       ).image,
                  //       fit: BoxFit.cover,
                  //     ),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         // color: Colors.grey.withOpacity(1),
                  //         color: context.theme.shadowColor,
                  //         spreadRadius: 1,
                  //         blurRadius: 7,
                  //         offset:
                  //             const Offset(0, 3), // changes position of shadow
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  tabBar(),
                  child,
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget tabBar() {
    return TabBar(
      // indicatorColor: const Color.fromARGB(255, 255, 14, 14),
      controller: signTabController,
      isScrollable: true,

      tabAlignment: TabAlignment.center,
      padding: const EdgeInsets.all(20),
      labelPadding: const EdgeInsets.all(15),
      splashBorderRadius: BorderRadius.circular(15),
      unselectedLabelColor: Colors.grey,
      onTap: (value) {
        setState(() {});
      },
      tabs: sign_tabs.map<Widget>((e) {
        return Text(
          e,
          style: TextStyle(
            color: context.theme.indicatorColor,
          ),
        );
      }).toList(),
    );
  }

  Widget signInBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Text(
                "Sign In",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2),
              child: Text(
                """
Untuk login app ini pastikan anda sudah membuat akun lalu memasukan kata sandi dan usename dengan benar
"""
                    .trim(),
              ),
            ),
          ],
        ),
        usernameForm(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          readOnly: is_procces,
        ),
        passwordForm(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          readOnly: is_procces,
        ),
        signButton(
          width: context.width,
          margin: EdgeInsets.all(10),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          text: "Sign In",
          onPressed: () async {
            try {
              ValidationData validationDataUsername = validation(data: username_text_editing_controller.text, validationDataType: ValidationDataType.username);
              ValidationData validationDataPassword = validation(data: password_text_editing_controller.text, validationDataType: ValidationDataType.password);

              if (validationDataUsername.is_valid == false) {
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.info,
                  title: "Username Format",
                  text: validationDataUsername.message,
                );
                return;
              }

              if (validationDataPassword.is_valid == false) {
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.info,
                  title: "Password Format",
                  text: validationDataPassword.message,
                );
                return;
              }

              widget.faxlClient.session_active = Session.create(
                client_user_id: 0,
              );

              await context.navigator().pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return ScreenPage(
                      faxlClient: widget.faxlClient,
                    );
                  },
                ),
              );
            } catch (e) {
              if (e is Map) {
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.error,
                  title: "Script Error",
                  text: jsonToMessage(e, isHtml: false, jsonFullMedia: {}),
                );
                return;
              }

              if (e is ClientException) {
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.error,
                  title: "Connection Api Error",
                  text: """
Tidak Dapat mengkoneksi ke jaringan pastikan internet anda stabil, jika stabil tetap error mungkin kami sedang maintance app
Tolong Coba Lagi Ntr Ya
"""
                      .trim(),
                );
                return;
              }
              await CoolAlert.show(
                context: context,
                type: CoolAlertType.error,
                title: "Script Error",
                text: "${e}",
              );
              return;
            }
          },
        ),
      ],
    );
  }

  Widget signUpBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        usernameForm(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          readOnly: is_procces,
        ),
        // telegramUserIdForm(
        //   padding: EdgeInsets.symmetric(
        //     horizontal: 10,
        //     vertical: 10,
        //   ),
        //   readOnly: is_procces,
        // ),
        passwordForm(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          readOnly: is_procces,
        ),
        passwordTwoForm(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          readOnly: is_procces,
        ),

        signButton(
          width: context.width,
          margin: EdgeInsets.all(10),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          text: "Sign Up",
          onPressed: () async {
            try {
              ValidationData validationDataUsername = validation(data: username_text_editing_controller.text, validationDataType: ValidationDataType.username);
              // ValidationData validationDataTelegramUserId = validation(data: telegram_user_id_text_editing_controller.text, validationDataType: ValidationDataType.telegram_user_id);

              ValidationData validationDataPasswordTwo = validation(data: password__text_editing_controller.text, validationDataType: ValidationDataType.password);
              ValidationData validationDataPassword = validation(data: password_text_editing_controller.text, validationDataType: ValidationDataType.password);

              if (validationDataUsername.is_valid == false) {
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.info,
                  title: "Username Format",
                  text: validationDataUsername.message,
                );
                return;
              }

              // if (validationDataTelegramUserId.is_valid == false) {
              //   await CoolAlert.show(
              //     context: context,
              //     type: CoolAlertType.info,
              //     title: "Telegram User Id Format",
              //     text: validationDataTelegramUserId.message,
              //   );
              //   return;
              // }

              if (validationDataPassword.is_valid == false) {
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.info,
                  title: "Password Format",
                  text: validationDataPassword.message,
                );
                return;
              }

              if (validationDataPasswordTwo.is_valid == false) {
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.info,
                  title: "Password TWO Format",
                  text: validationDataPasswordTwo.message,
                );
                return;
              }

              if (password_text_editing_controller.text != password__text_editing_controller.text) {
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.info,
                  title: "Password Format",
                  text: "Maaf Password Harus Sama",
                );
                return;
              }

              widget.faxlClient.session_active = Session.create();

              await context.navigator().pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return ScreenPage(
                      faxlClient: widget.faxlClient,
                    );
                  },
                ),
              );
            } catch (e) {
              if (e is Map) {
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.error,
                  title: "Script Error",
                  text: jsonToMessage(e, isHtml: false, jsonFullMedia: {}),
                );
                return;
              }

              if (e is ClientException) {
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.error,
                  title: "Connection Api Error",
                  text: """
Tidak Dapat mengkoneksi ke jaringan pastikan internet anda stabil, jika stabil tetap error mungkin kami sedang maintance app
Tolong Coba Lagi Ntr Ya
"""
                      .trim(),
                );
                return;
              }
              await CoolAlert.show(
                context: context,
                type: CoolAlertType.error,
                title: "Script Error",
                text: "${e}",
              );
              return;
            }
          },
        ),
      ],
    );
  }

  Widget resetBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Text(
                "Reset Password",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        usernameForm(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          readOnly: is_procces,
        ),
        signButton(
          width: context.width,
          margin: EdgeInsets.all(10),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          text: "Reset Password",
          onPressed: () async {
            try {
              // ValidationData validationDataTelegramUserId = validation(data: telegram_user_id_text_editing_controller.text, validationDataType: ValidationDataType.telegram_user_id);

              ValidationData validationDataUsername = validation(data: username_text_editing_controller.text, validationDataType: ValidationDataType.username);

              // if (validationDataTelegramUserId.is_valid == false) {
              //   await CoolAlert.show(
              //     context: context,
              //     type: CoolAlertType.info,
              //     title: "Fomrat Format",
              //     text: validationDataTelegramUserId.message,
              //   );
              //   return;
              // }
              if (validationDataUsername.is_valid == false) {
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.info,
                  title: "Username Format",
                  text: validationDataUsername.message,
                );
                return;
              }
            } catch (e) {
              if (e is Map) {
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.error,
                  title: "Script Error",
                  text: jsonToMessage(e, isHtml: false, jsonFullMedia: {}),
                );
                return;
              }

              if (e is ClientException) {
                await CoolAlert.show(
                  context: context,
                  type: CoolAlertType.error,
                  title: "Connection Api Error",
                  text: """
Tidak Dapat mengkoneksi ke jaringan pastikan internet anda stabil, jika stabil tetap error mungkin kami sedang maintance app
Tolong Coba Lagi Ntr Ya
"""
                      .trim(),
                );
                return;
              }
              await CoolAlert.show(
                context: context,
                type: CoolAlertType.error,
                title: "Script Error",
                text: "${e}",
              );
              return;
            }
          },
        ),
      ],
    );
  }

  // Widget telegramUserIdForm({
  //   EdgeInsets padding = const EdgeInsets.all(10),
  //   bool readOnly = false,
  // }) {
  //   return Padding(
  //     padding: padding,
  //     child: textFormField(
  //       hintText: "1234567 (buka Telgram @MEESAGEEBOT  /getme)",
  //       labelText: "Telegram User Id",
  //       controller: telegram_user_id_text_editing_controller,
  //       prefixIconData: Hicons.security_safe_light_outline,
  //       readOnly: readOnly,
  //       validator: (String? data) {
  //         ValidationData validationData = validation(data: data, validationDataType: ValidationDataType.telegram_user_id);
  //         return validationData.message;
  //       },
  //     ),
  //   );
  // }

  Widget usernameForm({
    EdgeInsets padding = const EdgeInsets.all(10),
    bool readOnly = false,
  }) {
    return Padding(
      padding: padding,
      child: textFormField(
        hintText: "username",
        labelText: "Username",
        controller: username_text_editing_controller,
        prefixIconData: Hicons.security_safe_light_outline,
        readOnly: readOnly,
        validator: (String? data) {
          ValidationData validationData = validation(data: data, validationDataType: ValidationDataType.username);
          return validationData.message;
        },
      ),
    );
  }

  Widget passwordFaxlForm({
    EdgeInsets padding = const EdgeInsets.all(10),
    bool readOnly = false,
  }) {
    return Padding(
      padding: padding,
      child: textFormField(
        hintText: "passsword  As 1.3 /",
        labelText: "Password Faxl",
        obscureText: true,
        controller: password_faxl_text_editing_controller,
        prefixIconData: Hicons.security_safe_light_outline,
        readOnly: readOnly,
        validator: (String? data) {
          ValidationData validationData = validation(data: data, validationDataType: ValidationDataType.password);
          return validationData.message;
        },
      ),
    );
  }

  Widget passwordForm({
    EdgeInsets padding = const EdgeInsets.all(10),
    bool readOnly = false,
  }) {
    return Padding(
      padding: padding,
      child: textFormField(
        hintText: "passsword As 1.3 /",
        labelText: "Password",
        controller: password_text_editing_controller,
        prefixIconData: Hicons.security_safe_light_outline,
        obscureText: (is_show_password == false),
        readOnly: readOnly,
        suffixIcon: InkWell(
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            setState(() {
              is_show_password = (!is_show_password);
            });
          },
          child: Icon(
            Icons.remove_red_eye_outlined,
            color: context.theme.primaryIconTheme.color,
            size: 18,
          ),
        ),
        validator: (String? data) {
          ValidationData validationData = validation(data: data, validationDataType: ValidationDataType.password);
          return validationData.message;
        },
      ),
    );
  }

  Widget passwordTwoForm({
    EdgeInsets padding = const EdgeInsets.all(10),
    bool readOnly = false,
  }) {
    return Padding(
      padding: padding,
      child: textFormField(
        hintText: "passsword As 1.3 /",
        labelText: "Password Enter Again",
        controller: password__text_editing_controller,
        prefixIconData: Hicons.security_safe_light_outline,
        obscureText: (is_show_password == false),
        readOnly: readOnly,
        suffixIcon: InkWell(
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            setState(() {
              is_show_password = (!is_show_password);
            });
          },
          child: Icon(
            Icons.remove_red_eye_outlined,
            color: context.theme.primaryIconTheme.color,
            size: 18,
          ),
        ),
        validator: (String? data) {
          ValidationData validationData = validation(data: data, validationDataType: ValidationDataType.password);
          if (validationData.message == null) {
            if (password__text_editing_controller.text != password_text_editing_controller.text) {
              return "Password Harus Sama";
            }
          }
          return validationData.message;
        },
      ),
    );
  }

  Widget phoneNumberForm({
    EdgeInsets padding = const EdgeInsets.all(10),
    bool readOnly = false,
  }) {
    return Padding(
      padding: padding,
      child: textFormField(
        hintText: "62123456789 / 1234567890:abcdfghijklmnopqrstuvwxyz",
        labelText: "Token Bot",
        controller: password__text_editing_controller,
        prefixIconData: Hicons.profile_1_light_outline,
        readOnly: readOnly,
        validator: (String? data) {
          ValidationData validationData = validation(data: data, validationDataType: ValidationDataType.username);
          return validationData.message;
        },
      ),
    );
  }

  Widget textFormField({
    String? hintText,
    String? labelText,
    IconData prefixIconData = Icons.people,
    Color color = Colors.white,
    TextEditingController? controller,
    String? Function(String? data)? validator,
    bool readOnly = false,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      cursorColor: context.theme.indicatorColor,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      readOnly: readOnly,
      obscureText: obscureText,
      style: const TextStyle(
          // color: Colors.black,
          ),
      onChanged: (value) {
        setState(() {});
      },
      clipBehavior: Clip.antiAlias,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0.0),
        hintText: hintText,
        labelText: labelText,
        labelStyle: context.theme.textTheme.labelSmall,
        hintStyle: const TextStyle(
          // color: Colors.grey,
          fontSize: 14.0,
        ),
        prefixIcon: Icon(
          prefixIconData,
          color: context.theme.primaryIconTheme.color,
          size: 18,
        ),
        suffixIcon: suffixIcon,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.focusColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.focusColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelStyle: context.theme.textTheme.labelMedium,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.focusColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.focusColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.indicatorColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }

  Widget signButton({
    double? width,
    required EdgeInsets margin,
    required BorderRadius borderRadius,
    required String text,
    required void Function()? onPressed,
  }) {
    return Container(
      width: width,
      height: 50,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(
          color: Colors.blue,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
        ),
      ),
    );
  }
}
