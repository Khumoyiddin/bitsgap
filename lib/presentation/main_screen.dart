import 'package:bitsgap_tt/application/observables/main_observable.dart';
import 'core/app_colors.dart';
import 'core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'character_card.dart';

const _padding = 20.0;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final double itemWidth = 160.0;
  final mainObservable = MainObservable();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Calculating the gap between the 2 cards, because the width of the are said to be fixed in figma design
    final crossAxisSpacing = screenWidth - (2 * itemWidth) - 2 * _padding;

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.whiteSmoke,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _padding),
          child: Observer(
            builder: (context) {
              if (mainObservable.isLoading) {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.irisBlue),
                );
              }
              if (mainObservable.isFailed) {
                return Center(
                  child: Text(mainObservable.errorMessage, style: AppTextStyles.body_1),
                );
              }
              final length = mainObservable.charactersInfo.results?.length ?? 0;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 225,
                  crossAxisSpacing: crossAxisSpacing,
                ),
                itemCount: length,
                itemBuilder: (_, index) {
                  return CharacterCard(index: index, mainObservable: mainObservable);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
