import 'package:bitsgap_tt/application/observables/main_observable.dart';
import 'package:bitsgap_tt/infrastructure/models/characters_info/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'character_details.dart';
import 'core/app_assets.dart';
import 'core/app_colors.dart';
import 'core/app_text_styles.dart';
import 'core/widgets/app_elevated_button.dart';
import 'core/widgets/app_image_network.dart';

const heroTag = 'pictureHero_';

class CharacterCard extends StatefulWidget {
  final int index;
  final MainObservable mainObservable;

  const CharacterCard({super.key, required this.index, required this.mainObservable});

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  Result? get character {
    try {
      return widget.mainObservable.charactersInfo.results?[widget.index];
    } catch (e) {
      throw UnimplementedError('Error on trying to get character data from characterInfo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CharacterDetailsScreen(
                  index: widget.index,
                  characterDetails: character ?? Result(),
                ),
              ),
            );
          },
          child: Container(
            width: 160,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: '$heroTag${widget.index}',
                  child: SizedBox(
                    height: 160,
                    width: 160,
                    child: AppImageNetwork(character?.image),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    character?.name ?? 'Name not specified',
                    style: AppTextStyles.body_1,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Observer(
            builder: (context) {
              String characterId = (character?.id ?? 1).toString();
              bool isLiked = widget.mainObservable.likes[characterId] ?? false;
              return AppElevatedButton(
                circleSize: 30,
                onPressed: () {
                  widget.mainObservable.changeLikeState(characterId);
                },
                icon: SvgPicture.asset(
                  isLiked ? SvgAssets.liked : SvgAssets.unliked,
                  width: 20,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
