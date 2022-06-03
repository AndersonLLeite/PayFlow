import 'package:flutter/material.dart';

import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons_widget.dart';

import '../../themes/app_text_styles.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback onPrimaryPressed;
  final String secondaryLabel;
  final VoidCallback onSecondaryPressed;
  final String title;
  final String subTitle;

  const BottomSheetWidget({
    Key? key,
    required this.primaryLabel,
    required this.onPrimaryPressed,
    required this.secondaryLabel,
    required this.onSecondaryPressed,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: SafeArea(
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                  child: Container(color: Colors.black.withOpacity(0.6)),
                ),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Text.rich(
                      TextSpan(
                          text: title,
                          style: TextStyles.buttonBoldHeading,
                          children: [
                            TextSpan(
                                text: "\n$subTitle",
                                style: TextStyles.buttonHeading)
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                 Container(
                    height: 1,
                    color: AppColors.stroke,
                 ),  
                  SetLAbelButtons(
                    enablePrimaryColor: true,
                    primaryLabel: primaryLabel,
                    onPrimaryPressed: onPrimaryPressed,
                    secondaryLabel: secondaryLabel,
                    onSecondaryPressed: onSecondaryPressed,
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
