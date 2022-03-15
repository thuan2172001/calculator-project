import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  final bool isLightTheme;
  DisplayScreen({
    @required this.primaryText,
    @required this.secondaryText,
    @required this.isLightTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            height: 80,
            child: SingleChildScrollView(
              reverse: true,
              child: Text(
                primaryText,
                maxLines: 1000,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            secondaryText,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
