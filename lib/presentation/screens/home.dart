import 'package:countries/core/colors.dart';
import 'package:countries/core/themes.dart';
import 'package:countries/data/source/country_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/source/bloc/country_bloc.dart';
import '../widgets/mainscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
            text: TextSpan(
                text: 'Explore',
                style: GoogleFonts.elsieSwashCaps(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                children: const [
              TextSpan(
                  text: '.',
                  style: TextStyle(
                      color: orange, fontSize: 24, fontWeight: FontWeight.bold))
            ])),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.light_mode_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            if (state is CountryLoaded) {
              return const MainScreen();
            } else if (state is CountryFailed) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 36),
                  const SizedBox(height: 12),
                  Text(state.errorMessage)
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
