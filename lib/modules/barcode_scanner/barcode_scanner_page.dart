import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/widgets/divider/divider_vertical/divider_vertical_widget.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons_widget.dart';

import '../../shared/themes/app_text_styles.dart';

class BarcodeScannerPage extends StatefulWidget {
  BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Escaneie o código de barras do boleto',
          style: TextStyles.buttonBackground,
        ),
        leading: BackButton(color: AppColors.background),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(color: Colors.black),
          ),
          Expanded(
            flex: 2,
            child: Container(color: Colors.transparent),
          ),
          Expanded(
            child: Container(color: Colors.black),
          ),
        ],
      ),
      bottomNavigationBar: SetLAbelButtons(
        primaryLabel: "Inserir código do boleto",
        onPrimaryPressed: () {},
        secondaryLabel: "Adicionar da galeria",
        onSecondaryPressed: () {},
      ),
    );
  }
}
