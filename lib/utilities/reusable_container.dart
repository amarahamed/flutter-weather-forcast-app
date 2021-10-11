import 'package:flutter/material.dart';

class ResuableCard extends StatelessWidget {
  final Widget cardChild;
  final Color containerColor;
  ResuableCard({@required this.cardChild, @required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: containerColor,
      ),
      child: cardChild,
    );
  }
}
