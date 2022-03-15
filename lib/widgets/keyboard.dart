import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/widgets/button.dart';

class Monitor extends StatelessWidget {
  final Function passToButton;
  final bool isLightTheme;
  Monitor(this.passToButton, this.isLightTheme);


  Widget rowButton(List<String> buttons) {
    return Expanded(
      child: Row(
        children: buttons
            .map((id) => CustomButton(id: id, onPressed: () => passToButton(id), isLightTheme: isLightTheme))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLightTheme ? ThemeLight.backgroundKeyboard : ThemeDark.backgroundKeyboard,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      child: Column(
        children: <Widget>[
          rowButton([
            ButtonId.ac,
            ButtonId.backspace,
            ButtonId.remainder,
            ButtonId.division,
          ]),
          rowButton([
            ButtonId.seven,
            ButtonId.eight,
            ButtonId.nine,
            ButtonId.multiplication,
          ]),
          rowButton([
            ButtonId.four,
            ButtonId.five,
            ButtonId.six,
            ButtonId.minus,
          ]),
          rowButton([
            ButtonId.one,
            ButtonId.tow,
            ButtonId.three,
            ButtonId.plus,
          ]),
          rowButton([
            ButtonId.zero,
            ButtonId.dot,
            ButtonId.equal,
          ]),
        ],
      ),
    );
  }
}
