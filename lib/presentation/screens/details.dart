import 'package:flutter/material.dart';

import 'package:countries/data/model/country_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.country,
  }) : super(key: key);

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(country.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailInfo(property: 'Population', value: country.population),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class DetailInfo extends StatelessWidget {
  const DetailInfo(
      {required this.property, this.value, this.valueList, Key? key})
      : super(key: key);

  final String property;
  final String? value;
  final List<String>? valueList;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(text: '$property:', children: [
      if (value != null) TextSpan(text: value),
    ]));
  }
}
