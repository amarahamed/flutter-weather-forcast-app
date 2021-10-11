import 'package:flutter/material.dart';
import 'package:weather/utilities/utilities.dart';

class BottomContainerRow extends StatelessWidget {
  final String label1, label2;
  final value1, value2;

  BottomContainerRow(
      {@required this.label1, @required this.value1, this.label2, this.value2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('${label1 ?? ''}   ➭   ${value1 ?? ''}',
            style: kSamllTextColor, softWrap: true),
        Text('|'),
        Text(
          '${label2 ?? ''}   ➭   ${value2 ?? ''}',
          style: kSamllTextColor,
          softWrap: true,
        ),
      ],
    );
  }
}
