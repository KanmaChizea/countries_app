import 'package:flutter/material.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo(this.property, this.value, {Key? key}) : super(key: key);

  final String property;
  final String value;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: '$property: ',
            style: Theme.of(context).textTheme.bodyText1,
            children: [
          TextSpan(text: value, style: Theme.of(context).textTheme.bodyText2),
        ]));
  }
}
