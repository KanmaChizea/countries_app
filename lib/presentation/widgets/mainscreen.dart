import 'package:countries/data/model/country_model.dart';
import 'package:countries/presentation/screens/details.dart';
import 'package:countries/presentation/widgets/filter.dart';
import 'package:countries/presentation/widgets/iconbutton.dart';
import 'package:countries/presentation/widgets/languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/country_bloc.dart';
import 'search_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchBar(),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ButtonWithIcon(
                label: 'EN',
                icon: Icons.language_outlined,
                onPressed: LanguageSheet()),
            ButtonWithIcon(
                label: 'Filter',
                icon: Icons.filter_alt_outlined,
                onPressed: FilterSheet()),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(child: BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            if (state is CountryLoaded) {
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return CountryCard(state.countries[index]);
                  },
                  itemCount: state.countries.length);
            }
            return Container();
          },
        ))
      ],
    );
  }
}

class CountryCard extends StatelessWidget {
  const CountryCard(this.country, {super.key});

  final Country country;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0),
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            country.flagURL,
            height: 32,
            width: 42,
            fit: BoxFit.fill,
          )),
      title: Text(country.name),
      subtitle: Text(country.capital),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailsScreen(country: country))),
    );
  }
}
