// ignore_for_file: use_build_context_syn

import 'package:faxl_app_ui/faxl_client/faxl_client.dart';
import 'package:faxl_app_ui/page/sign/sign.dart';
import 'package:faxl_app_ui/widget/animated_image_container.dart';
import 'package:faxl_lib_flutter/faxl_lib_flutter.dart';
import 'package:flutter/material.dart';

class FaxlApp extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeModeNotifier;
  const FaxlApp({super.key, required this.themeModeNotifier});
  @override
  State<FaxlApp> createState() => _FaxlAppState();
}

class _FaxlAppState extends State<FaxlApp> {
  String text = "Init App";
  // bool is_found = false;
  // int count = 0;
  // late glx_lib.Listener listener;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((Duration duration) async {
      await task();
    });
  }

  @override
  dispose() {
    // listener.cancel();
    super.dispose();
  }

  Future<void> task() async {
    setState(() {
      text = "Initialized Client";
    });
    Future(() async {
      FaxlClient faxlClient =FaxlClient(
        themeModeNotifier: widget.themeModeNotifier,
      );
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        text = "Find Account Local";
      });

      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        text = "Account Local Not Found";
      });
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        text = "Go Sign Page";
      });
      await Future.delayed(const Duration(milliseconds: 500));
      // ignore: use_build_context_synchronously
      context.navigator().pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return SignPage(faxlClient: faxlClient);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: AnimatedImageContainer(
              width: 150,
              height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
