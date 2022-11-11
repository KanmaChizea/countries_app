import 'package:flutter/material.dart';

import '../shared/bottomsheet_header.dart';

final languageList = [
  'Bahosa',
  'Deutsch',
  'English',
  'Espaňol',
  'Française',
  'Italiano',
  'Português',
  'Pŷcckuü',
  'Svenska',
  'Türkçe',
  '日本',
  'عربى',
  '中国人'
];

class LanguageSheet extends StatelessWidget {
  const LanguageSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        children: [
          const BottomSheetHeader('Languages'),
          const SizedBox(height: 16),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(languageList[index]),
                          const Icon(Icons.radio_button_off)
                        ],
                      ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: languageList.length))
        ],
      ),
    );
  }
}
