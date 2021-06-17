import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spaces/spaces.dart';
import '/app/controllers/calculator_controller.dart';
import 'widgets/authenticated.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CalculatorView extends GetWidget<CalculatorController> {
  @override
  Widget build(BuildContext context) {
    return Authenticated(
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          var width = (sizingInformation.isDesktop) ? Get.width / 2 : Get.width;
          return Container(
            width: width,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Space.big(),
                  SelectableText('Sum (USD):'),
                  TextFormField(
                    controller: controller.inputController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                    ],
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                        prefix: Text('\$'),
                        labelText: 'Enter Amount in USD and press ENTER',
                        hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                    onEditingComplete: () => controller.calculate(),
                  ),
                  Text('* Enter sum in USD and press ENTER'),
                  Space.normal(),
                  SelectableText('Calculated sum (EUR):'),
                  TextFormField(
                    controller: controller.responseController,
                    decoration: InputDecoration(
                        prefix: Text('\€'),
                        labelText: 'Sum in EUR',
                        hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                    enabled: false,
                  ),
                  Space.normal(),
                  SelectableText('Current USD to EUR rate:'),
                  TextFormField(
                    controller: controller.currencyRateController,
                    decoration: InputDecoration(
                        prefix: Text('\€'),
                        labelText: '1 USD in EUR',
                        hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                    enabled: false,
                  ),
                  Space.big()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
