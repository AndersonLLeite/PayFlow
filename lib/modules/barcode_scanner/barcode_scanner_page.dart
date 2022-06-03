import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/bercode_scanner_status.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:payflow/shared/widgets/divider/divider_vertical/divider_vertical_widget.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons_widget.dart';

import '../../shared/themes/app_text_styles.dart';
import 'barcode_scanner_controller.dart';

class BarcodeScannerPage extends StatefulWidget {
  BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if(controller.status.hasBarcode){
        Navigator.pushReplacementNamed(context, "/insert_boleto");
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    child: status.cameraController!.buildPreview(),
                  );
                } else {
                  return Container();
                }
              }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: true,
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
                    child: Container(color: Colors.black.withOpacity(0.6)),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(color: Colors.transparent),
                  ),
                  Expanded(
                    child: Container(color: Colors.black.withOpacity(0.6)),
                  ),
                ],
              ),
              bottomNavigationBar: SetLAbelButtons(
                primaryLabel: "Inserir código do boleto",
                onPrimaryPressed: () {},
                secondaryLabel: "Adicionar da galeria",
                onSecondaryPressed: () {},
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.hasError) {
                  return BottomSheetWidget(
                    primaryLabel: 'Escanear novamente',
                    onPrimaryPressed: () {
                      controller.getAvailableCameras();
                    },
                    secondaryLabel: 'Digitar código',
                    onSecondaryPressed: () {},
                    title:
                        'não foi possivel identificar o código de barras do seu boleto',
                    subTitle:
                        'tente escanear novamente ou digite o código do seu boleto',
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
