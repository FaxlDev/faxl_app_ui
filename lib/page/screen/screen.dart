// ignore_for_file: avoid_print, unused_local_variable, dead_code, non_constant_identifier_names, unnecessary_string_interpolations

import 'dart:math';

import 'package:faxl_app_ui/faxl_client/scheme/scheme.dart';
import 'package:faxl_app_ui/page/chat/chat.dart';
import 'package:faxl_app_ui/widget/faxl_app_ui_client_flutter_stateful_widget.dart';
import 'package:faxl_app_ui/widget/profile_picture.dart';
import 'package:faxl_app_ui/widget/switch.dart';
import 'package:faxl_lib_flutter/faxl_lib_flutter.dart';
import 'package:flutter/material.dart';

enum ScreenPageScreenType {
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

class ScreenPage extends FaxlAppUiAppStatefulWidget {
  // final Tdlib tdlib;
  const ScreenPage({
    super.key,
    required super.faxlClient,
    // required this.tdlib,
  });

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  bool is_load_chats = false;
  List<Chat> chats = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {});

      onInit();
    });
  }

  void onInit() async {
    print("getChats");
    Future(() async {
      setState(() {
        chats = List.generate(Random().nextInt(100) + 25, (index) {
          return Chat.create(
            id: index + 2,
            first_name: "FAXL DEV",
            last_name: "${index + 2}",
            type: "private",
            status: "online",
            member_count: Random().nextInt(100000) + 55,
            last_message: Message.create(
                id: 1,
                from: User.create(
                  id: index + 1,
                  first_name: "FAXL DEV",
                  last_name: "${index + 1}",
                ),
                chat: Chat.create(
                  id: index + 2,
                  first_name: "FAXL DEV",
                  last_name: "${index + 2}",
                ),
                date: DateTime.now().millisecondsSinceEpoch,
                is_outgoing: Random().nextBool(),
                content: ContentMessage.create(type: "text", text: "Hallo ${DateTime.now()}")),
          );
        });
      });
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        is_load_chats = true;
      });
    });
  }

  final GlobalKey globalKey = GlobalKey();
  final GlobalKey bottomBarKey = GlobalKey();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
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
                            if (scaffoldKey.currentState!.isDrawerOpen) {
                              // scaffoldKey.currentState!
                              scaffoldKey.currentState!.closeDrawer();
                            } else {
                              scaffoldKey.currentState!.openDrawer();
                            }
                          },
                          child: const Icon(Icons.menu),
                        )),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Faxl App",
                        style: TextStyle(
                          // color: AppColors.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        width: context.width / 2,
        backgroundColor: context.theme.dialogBackgroundColor.withOpacity(0.85),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfilePicture(
                    pathImage: "assets/icons/app.jpeg",
                    width: 70,
                    height: 70,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    onPressed: () {},
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ThemeToggleSwitch(
                      faxlClient: widget.faxlClient,
                    ),
                  )
                ],
              ),
            ),
            ExpansionTile(
              title: Text(
                'Accounts',
                style: TextStyle(
                  color: context.theme.indicatorColor,
                ),
              ),
              children: [
                ListTile(
                  onTap: () {},
                  leading: ProfilePicture(
                    pathImage: "assets/icons/app.jpeg",
                    width: 40,
                    height: 40,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    onPressed: () {},
                  ),
                  title: Text(
                    'FAXL DEV',
                    style: TextStyle(
                      color: context.theme.indicatorColor,
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              onTap: () async {},
              leading: const Icon(
                Icons.add,
              ),
              title: Text(
                'Add Account',
                style: TextStyle(
                  color: context.theme.indicatorColor,
                ),
              ),
            ),
            const Divider(
              height: 0,
            ),
            ListTile(
              onTap: () async {},
              leading: const Icon(
                Icons.people,
              ),
              title: Text(
                'New Group',
                style: TextStyle(
                  color: context.theme.indicatorColor,
                ),
              ),
            ),
            ListTile(
              onTap: () async {},
              leading: const Icon(
                Icons.people,
              ),
              title: Text(
                'New Supergroup',
                style: TextStyle(
                  color: context.theme.indicatorColor,
                ),
              ),
            ),
            ListTile(
              onTap: () async {},
              leading: const Icon(
                Icons.speaker,
              ),
              title: Text(
                'New Channel',
                style: TextStyle(
                  color: context.theme.indicatorColor,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.people,
              ),
              title: Text(
                'New Stories',
                style: TextStyle(
                  color: context.theme.indicatorColor,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.people,
              ),
              title: Text(
                'My Stories',
                style: TextStyle(
                  color: context.theme.indicatorColor,
                ),
              ),
            ),
            ListTile(
              onTap: () async {},
              leading: const Icon(
                Icons.contact_phone,
              ),
              title: Text(
                'Contacts',
                style: TextStyle(
                  color: context.theme.indicatorColor,
                ),
              ),
            ),
            ListTile(
              onTap: () async {},
              leading: const Icon(
                Icons.contact_phone,
              ),
              title: Text(
                'Kontak',
                style: TextStyle(
                  color: context.theme.indicatorColor,
                ),
              ),
            ),
            ListTile(
              onTap: () async {},
              leading: const Icon(
                Icons.call,
              ),
              title: Text(
                'Panggilan',
                style: TextStyle(
                  color: context.theme.indicatorColor,
                ),
              ),
            ),
            ListTile(
              onTap: () async {},
              leading: const Icon(
                Icons.people,
              ),
              title: Text(
                'Pengguna Sekitar',
                style: TextStyle(
                  color: context.theme.indicatorColor,
                ),
              ),
            ),
            ListTile(
              onTap: () async {},
              leading: const Icon(
                Icons.message,
              ),
              title: Text(
                'Pesan Tersimpan',
                style: TextStyle(
                  color: context.theme.indicatorColor,
                ),
              ),
            ),
            ListTile(
              onTap: () async {},
              leading: const Icon(
                Icons.settings,
              ),
              title: Text(
                'Settings',
                style: TextStyle(
                  color: context.theme.indicatorColor,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (context) {
          if (is_load_chats == false) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: context.height,
                minWidth: context.width,
              ),
              child: Column(
                children: [
                  SizedBox.fromSize(
                    size: globalKey.sizeRenderBox(),
                  ),
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: true,
                    child: ListView.builder(
                      itemCount: chats.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Chat chat = chats[index];
                        String nick_name = "${chat.first_name ?? ""} ${chat.last_name ?? ""} ${chat.title ?? ""}".trim();
                        String content_message = "${chat.last_message.content.text ?? ""} ${chat.last_message.content.caption ?? ""}".trim();
                        DateTime dateTime = DateTime.fromMillisecondsSinceEpoch((chat.last_message.date ?? 0).toInt());
                        String date_msg = "${dateTime.hour}:${dateTime.minute}";
                        if (content_message.isEmpty) {
                          content_message = "${chat.last_message.content.type ?? ""}".trim();
                        }
                        return ListTile(
                          onTap: () async {
                            context.navigator().push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ChatPage(faxlClient: widget.faxlClient, chat: chat,);
                                },
                              ),
                            );
                          },
                          contentPadding: const EdgeInsets.all(10),
                          leading: ProfilePicture(
                            pathImage: "assets/icons/app.jpeg",
                            nick_name: nick_name,
                            width: 50,
                            height: 50,
                            borderRadius: const BorderRadius.all(Radius.circular(50)),
                            onPressed: () {},
                          ),
                          title: Text(
                            nick_name,
                            style: TextStyle(
                              color: context.theme.indicatorColor,
                            ),
                          ),
                          subtitle: Text(
                            content_message,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          trailing: Text(date_msg),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.create),
      ),
    );
  }
}
