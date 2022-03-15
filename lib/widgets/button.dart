import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';

class CustomButton extends StatelessWidget {
  final String id;
  final VoidCallback onPressed;
  final bool isLightTheme;
  CustomButton({@required this.id, @required this.onPressed, @required this.isLightTheme});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: id == ButtonId.zero ? 2 : 1,
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.all(6.0),
        child: ElevatedButton(
          onPressed: onPressed,
          onLongPress: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            primary: isLightTheme ? ThemeLight.backgroundButton : ThemeDark.backgroundButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          child: setChild(id, isLightTheme),
        ),
      ),
    );
  }
}

Widget setChild(String id, bool isLightTheme) {
  if ([ButtonId.ac, ButtonId.backspace].indexOf(id) > -1)
    return Text(
      id,
      style: TextStyle(
        color: isLightTheme ? ThemeLight.deleteButton : ThemeDark.deleteButton,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    );

  if (RegExp(r'[\d\.]').hasMatch(id))
    return Text(
      id,
      style: TextStyle(
        color: isLightTheme ? ThemeLight.primaryText : ThemeDark.primaryText,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    );

  return Text(
    id,
    style: TextStyle(
      color: isLightTheme ? ThemeLight.functionButton : ThemeDark.functionButton,
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
    ),
  );
}
