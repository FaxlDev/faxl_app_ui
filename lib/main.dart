import 'package:faxl_app_ui/faxl_app_ui.dart';
import 'package:faxl_lib_flutter/faxl_lib_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(ThemeMode.system);
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FaxlLibFlutterAppMain(
      theme_notifier: themeModeNotifier,
      builder: (themeMode, lightTheme, darkTheme, widget) {
        // return;
        Widget child = FaxlApp(
          themeModeNotifier: themeModeNotifier,
        );

        // if (dart.isDebug) {
        //   return MaterialApp(
        //     title: 'Faxl APP',
        //     debugShowCheckedModeBanner: false,
        //     themeMode: themeMode,
        //     theme: lightheme,
        //     darkTheme: darktheme,
        //     home: Simulate(
        //       home: child,
        //     ),
        //   );
        // }
        // Simulate();
        //

        return MaterialApp(
          title: 'Faxl APP',
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: lightTheme.copyWith(
            textTheme: Typography().black.apply(
                  fontFamily: "Poppins",
                ),
          ),
          darkTheme: darkTheme.copyWith(
            textTheme: Typography().white.apply(
                  fontFamily: "Poppins",
                ),
          ),
          home: child,
        );
      },
    );
  }
}
