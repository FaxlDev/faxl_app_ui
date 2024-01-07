// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

// import 'package:hive_flutter/hive_flutter.dart';
import 'package:universal_io/io.dart';
import 'package:flutter/material.dart';

MaterialColor randomColors() {
  List<MaterialColor> colors = [
    Colors.blue,
    Colors.blueGrey,
    Colors.brown,
    Colors.cyan,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.green,
    Colors.grey,
    Colors.indigo,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.lime
  ];
  colors.shuffle();
  return colors[0];
}

class ProfilePicture extends StatelessWidget {
  final String pathImage;
  final String nick_name;
  final double width;
  final double height;
  final BorderRadiusGeometry? borderRadius;
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final void Function(bool data)? onHighlightChanged;
  const ProfilePicture({
    super.key,
    required this.pathImage,
    required this.width,
    required this.height,
    this.nick_name = "-",
    this.borderRadius,
    this.onLongPress,
    this.onHighlightChanged,
    required this.onPressed,
  });

  String get path_image {
    return pathImage;
  }

  File get file {
    return File(pathImage);
  }

  @override
  Widget build(BuildContext context) {
    DecorationImage? image;
    if (path_image.isNotEmpty) {
      image = DecorationImage(
        fit: BoxFit.cover,
        image: Image.asset(pathImage).image,
        // image: AssetImage(pathImage),
        onError: (errDetails, error) {},
      );
    }
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: randomColors(),
        borderRadius: borderRadius ??
            BorderRadius.circular(
              15,
            ),
        image: image,
        // boxShadow: [
        //   BoxShadow(
        //     // color: Colors.grey.withOpacity(1),
        //     color: context.theme.shadowColor,
        //     spreadRadius: 1,
        //     blurRadius: 7,
        //     offset: const Offset(0, 3), // changes position of shadow
        //   ),
        // ],

        gradient: const LinearGradient(
          colors: [
            Colors.pinkAccent,
            Colors.blue,
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.pink,
            offset: Offset(-2, 0),
            blurRadius: 15,
          ),
          BoxShadow(
            color: Colors.blue,
            offset: Offset(2, 0),
            blurRadius: 15,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        clipBehavior: Clip.antiAlias,
        minWidth: 0,
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHighlightChanged: onHighlightChanged,
        child: Visibility(
          visible: path_image.isEmpty,
          child: Center(
            child: Text(
              nick_name.characters.first,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
