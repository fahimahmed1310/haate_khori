import 'package:flutter/material.dart';
import 'package:haate_khori_app/constants/app_constants.dart';

class AppTitleUi extends StatelessWidget {
  const AppTitleUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: const TextSpan(
          text: AppConstants.appTitleFirstPart,
          style:AppConstants.appTitleFirstPartTextStyle,
          children:  <TextSpan>[
            TextSpan(
              text: AppConstants.appTitleSecondPart,
              style: AppConstants.appTitleSecondPartTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}