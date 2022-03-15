import 'package:flutter/material.dart';
import 'package:untitled/utils/math.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/utils/utils.dart';
import 'package:untitled/widgets/keyboard.dart';
import 'package:untitled/widgets/monitor.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _primaryText = '';
  String _secondaryText = '';
  bool isLightTheme = true;

  void buttonPressed(String id) {
    setState(
      () {
        if (id == ButtonId.ac) {
          _primaryText = '';
          _secondaryText = '';
        } else if (id == ButtonId.equal) {
          double result = calculate(_primaryText);
          if (result != double.infinity) {
            _secondaryText = _primaryText;
            _primaryText = clear(result);
          } else {
            _secondaryText = 'Invalid expression';
          }
        } else if (id == ButtonId.backspace) {
          _primaryText = _primaryText.replaceAll(RegExp(r'.$'), '');
          double result = calculate(_primaryText);
          if (result != double.infinity) _secondaryText = clear(result);
        } else {
          _primaryText += id;
          double result = calculate(_primaryText);
          if (result != double.infinity) _secondaryText = clear(result);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          margin: EdgeInsets.only(left: 8),
          child: GestureDetector(
            onTap: () {
              setState(() {
                isLightTheme = !isLightTheme;
              });
            },
            child: Icon(
              isLightTheme ? Icons.brightness_4 : Icons.brightness_2,
              size: 20,
              color: !isLightTheme ? ThemeLight.primaryText : ThemeDark.primaryText,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: DisplayScreen(
                  primaryText: _primaryText,
                  secondaryText: _secondaryText,
                  isLightTheme: isLightTheme
              ),
            ),
            Expanded(
              flex: 2,
              child: Monitor(buttonPressed, isLightTheme),
            ),
          ],
        ),
      ),
    );
  }
}
