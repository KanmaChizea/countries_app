import 'package:flutter/material.dart';

import 'arrow.dart';

class ImageNavigator extends StatelessWidget {
  const ImageNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ArrowButton(Icons.arrow_back_ios_new),
            ArrowButton(Icons.arrow_forward_ios),
          ]),
    );
  }
}
