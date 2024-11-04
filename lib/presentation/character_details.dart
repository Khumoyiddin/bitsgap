import 'core/app_assets.dart';
import 'core/app_colors.dart';
import 'core/app_text_styles.dart';
import 'core/widgets/app_image_network.dart';
import 'core/widgets/app_elevated_button.dart';
import 'package:bitsgap_tt/infrastructure/models/characters_info/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'character_card.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final int index;
  final Result characterDetails;

  const CharacterDetailsScreen({
    super.key,
    required this.index,
    required this.characterDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: '$heroTag$index',
                child: AppImageNetwork(
                  characterDetails.image,
                  height: 260,
                  width: double.infinity,
                ),
              ),
              Positioned(
                left: 20,
                child: SafeArea(
                  child: AppElevatedButton(
                    circleSize: 44,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(SvgAssets.arrowLeft),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          InfoItem(
            field: 'Name',
            value: characterDetails.name ?? 'No name',
            icon: SvgAssets.information,
          ),
          InfoItem(
            field: 'Status',
            value: characterDetails.status ?? 'Not specified',
            icon: _getStatusIcon(),
          ),
          InfoItem(
            field: 'Species',
            value: characterDetails.species ?? 'Not specified',
            icon: _getSpeciesIcon(),
          ),
          InfoItem(
            field: 'Gender',
            value: characterDetails.gender ?? 'Not specified',
            icon: _getGenderIcon(),
          ),
        ],
      ),
    );
  }

  String _getStatusIcon() {
    if (characterDetails.status?.toLowerCase() == 'alive') {
      return SvgAssets.alive;
    } else if (characterDetails.status?.toLowerCase() == 'dead') {
      return SvgAssets.dead;
    } else {
      return SvgAssets.statusUnknown;
    }
  }

  String _getSpeciesIcon() {
    return characterDetails.species?.toLowerCase() == 'human' ? SvgAssets.human : SvgAssets.alien;
  }

  String _getGenderIcon() {
    if (characterDetails.gender?.toLowerCase() == 'male') {
      return SvgAssets.male;
    } else if (characterDetails.gender?.toLowerCase() == 'female') {
      return SvgAssets.female;
    } else {
      return SvgAssets.genderUnknown;
    }
  }
}

class InfoItem extends StatelessWidget {
  final String field;
  final String value;
  final String icon;

  const InfoItem({super.key, required this.field, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, bottom: 12, right: 20),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.irisBlue,
            child: SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(AppColors.whiteSmoke, BlendMode.srcIn),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              field,
              style: AppTextStyles.body_2.copyWith(color: AppColors.grey),
            ),
            Text(
              value,
              style: AppTextStyles.subtitle,
            ),
          ],
        ),
      ],
    );
  }
}
