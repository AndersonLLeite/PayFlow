import 'package:flutter/material.dart';

import '../../models/boleto_model.dart';
import '../boleto_tile/boleto_tile_widget.dart';
import 'boleto_list_controller.dart';

class BoletoListWidget extends StatefulWidget {
  BoletoListWidget({Key? key}) : super(key: key);

  @override
  State<BoletoListWidget> createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  final controller = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>> (
      valueListenable: controller.boletosNotifier,
      builder: (_, boletos, __) => Column(
        children: 
          controller.boletos.map((e) => BoletoTileWidget(data: e)).toList()
      )
    );
  }
}