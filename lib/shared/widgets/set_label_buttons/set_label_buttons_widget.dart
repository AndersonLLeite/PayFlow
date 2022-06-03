import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';

import '../../themes/app_text_styles.dart';
import '../divider/divider_vertical/divider_vertical_widget.dart';
import '../label_button/label_button.dart';

class SetLAbelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback onPrimaryPressed;
  final String secondaryLabel;
  final VoidCallback onSecondaryPressed;
  final bool enablePrimaryColor;
  const SetLAbelButtons({
    Key? key,
    required this.primaryLabel,
    required this.onPrimaryPressed,
    required this.secondaryLabel,
    required this.onSecondaryPressed,
    this.enablePrimaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        color: AppColors.shape,
        height: 56,
        child: Row(
          children: [
            Expanded(
              child: LabelButton(
                label: primaryLabel,
                onPressed: onPrimaryPressed,
                style: enablePrimaryColor? TextStyles.buttonPrimary : null
              ),
            ),
            DividerVerticalWidget(),
            Expanded(
              child: LabelButton(
                label: secondaryLabel,
                onPressed: onSecondaryPressed,
              
              ),
            ),
          ],
        ),
      );
  }
}
