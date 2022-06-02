import 'package:flutter/material.dart';

import '../divider/divider_vertical/divider_vertical_widget.dart';
import '../label_button/label_button.dart';

class SetLAbelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback onPrimaryPressed;
  final String secondaryLabel;
  final VoidCallback onSecondaryPressed;
  const SetLAbelButtons({
    Key? key,
    required this.primaryLabel,
    required this.onPrimaryPressed,
    required this.secondaryLabel,
    required this.onSecondaryPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        height: 56,
        child: Row(
          children: [
            Expanded(
              child: LabelButton(
                label: primaryLabel,
                onPressed: onPrimaryPressed,
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
