// ignore_for_file: avoid_print, unused_local_variable, dead_code, non_constant_identifier_names, unnecessary_string_interpolations
 

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:faxl_app_ui/faxl_client/scheme/scheme.dart' as faxl_client_scheme;
import 'package:faxl_app_ui/widget/faxl_app_ui_client_flutter_stateful_widget.dart';
import 'package:faxl_app_ui/widget/profile_picture.dart';
import 'package:faxl_lib/faxl_lib.dart';
import 'package:faxl_lib_flutter/faxl_lib_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:universal_io/io.dart';

enum ChatPageScreenType {
  home,

  profile,
}

class BottomBarData {
  final IconData iconData;
  final String title;
  BottomBarData({
    required this.iconData,
    required this.title,
  });
}

class ChatPage extends FaxlAppUiAppStatefulWidget {
  final faxl_client_scheme.Chat chat;
  const ChatPage({
    super.key,
    required this.chat,
    required super.faxlClient,
    // required this.tdlib,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool is_load_chats = false;

  AutoScrollController autoScrollController = AutoScrollController();
  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();

  List<types.Message> messages = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
      listViewMsgs();
    });
  }

  final GlobalKey globalKey = GlobalKey();
  final GlobalKey bottomBarKey = GlobalKey();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late bool isEmoji = false;

  @override
  void dispose() {
    super.dispose();
  }

  listViewMsgs() {
    DateTime dateTime = DateTime.now();

    messages = [
      types.TextMessage.fromJson(
         {
          "author": const {
            "firstName": "user",
            "id": "4c2307ba-3d40-442f-b1ff-b271f63904ca",
            "lastName": "bot",
          },
          "createdAt": 1655648404000,
          "id": "c67ed376-52bf-4d4e-ba2a-7a0f8467b22a",
          "status": "seen",
          "text": """
Hai Perkenalkan saya adalah robot silahkan typing

ping untuk mengecek bot
echo <text> untuk echo

Buatan FAXLDEV
""".trim(),
          "type": "text",
          "Sasa": "sas"
        },
      ), 
    ].reversed.toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // context.mediaQueryData.padding.top.printPretty(2);
    EdgeInsets edgeinsetsTop = context.mediaQueryData.padding;
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size(
          context.width,
          450,
        ), // here the desired height
        child: Container(
          key: globalKey,
          decoration: BoxDecoration(
            // borderRadius: const BorderRadius.only(
            //   bottomLeft: Radius.circular(40),
            //   bottomRight: Radius.circular(40),
            // ),
            color: context.theme.dialogBackgroundColor.withOpacity(0.85),
            // color: Colors.white.withOpacity(0.85),
            boxShadow: [
              BoxShadow(
                color: context.theme.shadowColor,
                //  color: context.theme.shadowColor.withAlpha(150),

                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.mediaQueryData.padding.top,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () async {},
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: InkWell(
                        onTap: () {
                          if (context.navigator().canPop()) {
                            context.navigator().pop();
                          }
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                    ProfilePicture(
                      pathImage: "assets/icons/app.jpeg",
                      width: 50,
                      height: 50,
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Builder(
                        builder: (context) {
                          String nick_name = "${widget.chat.first_name ?? ""} ${widget.chat.last_name ?? ""} ${widget.chat.title ?? ""}".trim();
                          String status_chat = "";
                          if (widget.chat.type != "private") {
                            status_chat = NumberFormat.compact().format(widget.chat.member_count);
                          } else {
                            status_chat = "${widget.chat.status ?? ""}".trim();
                          }
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nick_name,
                                style: const TextStyle(
                                  // color: AppColors.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                status_chat,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  // fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        constraints: BoxConstraints(
          minHeight: context.height,
          minWidth: context.width,
          // maxHeight: screenSize,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              "assets/images/wp.jpg",
            ).image,
          ),
        ),
        child: Chat(
          scrollController: autoScrollController,
          scrollPhysics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          messages: messages,
          onAttachmentPressed: () {},
          disableImageGallery: true,
          onMessageTap: (context, p1) {},
          onPreviewDataFetched: (p0, p1) {},
          onSendPressed: (p0) {},
          theme: const DefaultChatTheme(
            backgroundColor: Colors.transparent,
            receivedMessageBodyTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              // height: 1.5,
            ),
            sentMessageBodyTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          bubbleBuilder: (child, {required message, required nextMessageInGroup}) {
            // message.toJson().printPretty();
            return Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                color: (message.author.id == "me") ? Colors.blue : context.theme.dialogBackgroundColor,
              ),
              child: child,
            );
          },
          useTopSafeAreaInset: true,
          customBottomWidget: Container(
            width: context.mediaQueryData.size.width,
            constraints: BoxConstraints(
              maxHeight: (!isEmoji) ? context.mediaQueryData.size.height * .30 : context.mediaQueryData.size.height * .70,
            ),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(40)),

              color: context.theme.dialogBackgroundColor,
              // color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: context.theme.shadowColor.withAlpha(110),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes positivalueon of shadow
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              horizontal: (isEmoji) ? 0 : 15,
            ),
            child: getInput(isEmojiView: isEmoji),
          ),
          showUserAvatars: false,
          showUserNames: false,
          user: const types.User(
            id: "me",
          ),
        ),
      ),
    );
  }

  Widget getInput({
    bool isEmojiView = false,
  }) {
    if (!isEmojiView) {
      return Row(
        crossAxisAlignment: (textEditingController.text.split("\n").length < 2) ? CrossAxisAlignment.center : CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              minWidth: 0,
              onPressed: () {
                setState(() {
                  isEmoji = !isEmoji;
                });
              },
              child: const Icon(
                Iconsax.emoji_normal,
                // color: (!isEmoji) ? Colors.black : Colors.blue,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                controller: textEditingController,
                // keyboardType: TextInputType.multiline,
                maxLines: null,
                cursorColor: context.theme.indicatorColor,
                onTap: () {},
                onChanged: (String value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(5.0),
                  hintText: 'input message here',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  floatingLabelStyle: const TextStyle(
                    color: Colors.transparent,
                    fontSize: 18.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: GestureDetector(
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(25.0),
              // ),
              // minWidth: 0,
              onVerticalDragUpdate: (details) {},
              onTap: () {},
              child: const Icon(
                Iconsax.attach_circle,
                // color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              minWidth: 0,
              onPressed: () {},
              child: const Icon(
                Iconsax.image,
                // color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              minWidth: 0,
              onPressed: () async {
                if (textEditingController.text.isEmpty) {
                  return;
                }

                messages.insert(
                  0,
                  types.TextMessage(
                    createdAt: DateTime.now().millisecondsSinceEpoch,
                    author: const types.User(
                      id: "me",
                    ),
                    id: getUuid(10),
                    text: textEditingController.text.trim(),
                  ),
                );
                String text = textEditingController.text;

                setState(() {
                  textEditingController.clear();
                });

                await autoScrollController.scrollToIndex(0);
                autoRespond(text: text);

                setState(() {});

                await autoScrollController.scrollToIndex(0);
              },
              child: Icon(
                Iconsax.send_1,
                color: (textEditingController.text.isNotEmpty) ? Colors.blue : null,
              ),
            ),
          ),
        ],
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: getInput(),
        ),
        Expanded(
          child: EmojiPicker(
            textEditingController: textEditingController, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
            config: Config(
              columns: 7,
              emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
              verticalSpacing: 0,
              horizontalSpacing: 0,
              gridPadding: EdgeInsets.zero,
              // initCategory: Category.RECENT,
              // initCategory: Category.RECENT,
              // bgColor: const Color.fromARGB(255, 255, 255, 255),
              bgColor: context.theme.dialogBackgroundColor,
              indicatorColor: Colors.blue,
              iconColor: Colors.grey,
              iconColorSelected: Colors.blue,
              backspaceColor: Colors.blue,
              skinToneDialogBgColor: Colors.white,
              skinToneIndicatorColor: Colors.grey,
              enableSkinTones: true,
              // showRecentsTab: true,
              recentsLimit: 28,
              noRecents: const Text(
                'No Recents',
                style: TextStyle(
                  fontSize: 20,
                  // color: Colors.black26,
                ),
                textAlign: TextAlign.center,
              ), // Needs to be const Widget
              loadingIndicator: const SizedBox.shrink(), // Needs to be const Widget
              tabIndicatorAnimDuration: kTabScrollDuration,
              categoryIcons: const CategoryIcons(),
              buttonMode: ButtonMode.MATERIAL,
            ),
          ),
        ),
      ],
    );
  }

  autoRespond({
    required String text,
  }) {
    String respond_text = "";
    if (RegExp(r"ping", caseSensitive: false).hashData(text)) {
      respond_text = "PONG";
    } else if (RegExp(r"hai", caseSensitive: false).hashData(text)) {
      respond_text = "Hai juga";
    } else if (RegExp(r"p", caseSensitive: false).hashData(text)) {
      respond_text = "Iya ada yang bisa saya bantu?";
    } else if (RegExp(r"^(echo (.*))", caseSensitive: false).hashData(text)) {
      respond_text = text.replaceAll(RegExp(r"^(echo)", caseSensitive: false), "");
    }

    if (respond_text.isEmpty) {
      respond_text = """
Maaf saya tidak tahu apa yang anda maksud
""";
    }
    messages.insert(
      0,
      types.TextMessage(
        createdAt: DateTime.now().millisecondsSinceEpoch,
        author: const types.User(
          id: "airin",
        ),
        id: getUuid(10),
        text: respond_text.trim(),
      ),
    );
  }
}
