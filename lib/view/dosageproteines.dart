import 'package:dosage/controller/dosagecontroller.dart';
import 'package:dosage/customertools/customer_widget.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Dosageproteines extends StatelessWidget {
  static const route = '/Dosagepr';
  Dosageproteines({Key? key}) : super(key: key);
  GlobalKey<FormState> _formpro = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DosageController viewmodule = Get.put(DosageController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formpro,
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Text(
                  'Dosage Protéines (Kjeldahl)',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 50,
                ),
                GetBuilder<DosageController>(builder: (value) {
                  return Column(children: [
                    CustomInputform(
                      title: 'Masse exacte de l\'echantillon analysé',
                      hint: 'Masse en g',
                      onsave: (String? Value) {
                         value.saveValue(value: Value!, type: 'm');
                      },
                      valid: (String? Value) {
                        value.valide(Value);
                      },
                    ),
                    SizedBox(height: 30),
                    CustomInputform(
                      title: 'Volume cerse de HCI 0,1 N',
                      hint: 'Volume en ml',
                      onsave: (String? Value) {
                        value.saveValue(value: Value!, type: 'v');
                      },
                      valid: (String? Value) {
                        value.valide(Value);
                      },
                    ),
                    SizedBox(height: 30),
                    CustomInputButton(
                      onPressed: () {
                        var x = _formpro.currentState;

                        if (x!.validate()) {
                          x.save();
                          value.results;
                        }
                      },
                      title: 'Calcul',
                    ),
                  ]);
                }),
                SizedBox(height: 40),
                Obx(
                  () {
                    return Text(
                      viewmodule.result.value,
                      style: TextStyle(fontSize: 20),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}