import 'package:flutter/material.dart';

import '../../core/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: lightGrey,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        prefixIcon: const Icon(Icons.search, color: grey),
        hintText: 'Search Country',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
      ),
    );
  }
}
