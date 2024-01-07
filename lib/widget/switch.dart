//  import 'package:faxl_app_ui/faxl_client/faxl_client.dart';
import 'package:faxl_app_ui/widget/faxl_app_ui_client_flutter_stateful_widget.dart';
import 'package:faxl_lib_flutter/faxl_lib_flutter.dart';
import 'package:flutter/material.dart';
// import 'package:_flutter/_flutter_core.dart';
// import 'package:faxl_client_flutter/widget/faxl_client_flutter_stateful_widget.dart';

class ThemeToggleSwitch extends FaxlAppUiAppStatefulWidget {
  const ThemeToggleSwitch({
    super.key,
    required super.faxlClient,
  });

  @override
  State<ThemeToggleSwitch> createState() => _ThemeToggleSwitchState();
}

class _ThemeToggleSwitchState extends State<ThemeToggleSwitch> {
  AlignmentGeometry switchInitialPosition = Alignment.centerLeft;
  AlignmentGeometry switchLastKnownPosition = Alignment.centerLeft;

  void toggleState() {
    switch (switchInitialPosition) {
      case Alignment.centerLeft:
        switchInitialPosition = Alignment.center;
        switchLastKnownPosition = Alignment.centerLeft;
        break;
      case Alignment.center:
        if (switchLastKnownPosition == Alignment.centerLeft) {
          switchInitialPosition = Alignment.centerRight;
        } else {
          switchInitialPosition = Alignment.centerLeft;
        }
        break;
      case Alignment.centerRight:
        switchInitialPosition = Alignment.center;
        switchLastKnownPosition = Alignment.centerRight;
        break;
      default:
        switchInitialPosition = Alignment.center;
        switchInitialPosition = Alignment.centerLeft;
        break;
    }

    if (switchInitialPosition == Alignment.centerLeft) {
      widget.faxlClient.themeModeNotifier.value = ThemeMode.dark;
    }

    if (switchInitialPosition == Alignment.center) {
      widget.faxlClient.themeModeNotifier.value = ThemeMode.system;
    }
    if (switchInitialPosition == Alignment.centerRight) {
      widget.faxlClient.themeModeNotifier.value = ThemeMode.light;
    }

    Future(() async {
      // await (widget.faxlClientFlutter.database.databaseLib.box_app).put("theme_mode", widget.appCore.themeModeNotifier.value.name);
    });

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    ThemeMode themeMode = widget.faxlClient.themeModeNotifier.value;
    if (themeMode == ThemeMode.dark) {
      setState(() {
        switchInitialPosition = Alignment.centerLeft;
        switchLastKnownPosition = Alignment.centerLeft;
      });
    }
    if (themeMode == ThemeMode.system) {
      setState(() {
        switchInitialPosition = Alignment.center;
        switchLastKnownPosition = Alignment.center;
      });
    }
    if (themeMode == ThemeMode.light) {
      setState(() {
        switchInitialPosition = Alignment.centerRight;
        switchLastKnownPosition = Alignment.centerRight;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76.5,
      height: 31,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: context.theme.dialogBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: context.theme.shadowColor.withAlpha(110),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
          BoxShadow(
            color: context.theme.shadowColor.withAlpha(110),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        onPressed: toggleState,
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.all(2.0),
        child: Align(
          alignment: switchInitialPosition,
          child: Icon(
            () {
              ThemeMode themeMode = widget.faxlClient.themeModeNotifier.value;
              if (themeMode == ThemeMode.dark) {
                return Icons.dark_mode;
              }

              if (themeMode == ThemeMode.system) {
                return Icons.auto_mode;
              }
              if (themeMode == ThemeMode.light) {
                return Icons.light_mode;
              }

              return Icons.auto_mode;
            }(),
            color: context.theme.indicatorColor,
          ),
        ),
      ),
    );
  }
}
