import 'package:flutter/material.dart';

import 'bottomsheet_header.dart';

class FilterSheet extends StatelessWidget {
  const FilterSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      child: Column(
        children: [
          const BottomSheetHeader('Filter'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
