import 'package:get/get.dart';

import '../controller/aciditehuilecontroller.dart';
import '../extensions/number_verifier.dart';
import 'package:flutter/material.dart';

import '../customertools/customer_widget.dart';

class AciditeHuile extends StatelessWidget {
  static const route = '/acidite';
  AciditeHuile({Key? key}) : super(key: key);
  GlobalKey<FormState> _formpro = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                  'L\'ACIDITÉ DANS UNE HUILE J.P: ${Get.arguments["jp"]}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 50,
                ),
                GetBuilder<AciditeHuileController>(
                    init: AciditeHuileController(),
                    builder: (value) {
                      return Column(
                        children: [
                          CustomInputform(
                            title: 'Masse De La Prise D\’essai D\’huile',
                            hint: 'Masse en g',
                            onsave: (String? Value) {
                              value.saveValue(value: Value!, type: 'm');
                            },
                            valid: (String? value) {
                              if (!value!.checkTryPars) {
                                return 'Vérifiez votre saisie';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          CustomInputform(
                            title: 'Volume De NaOH 0.1N Utilisé',
                            hint: 'Masse en ml',
                            onsave: (String? Value) {
                              value.saveValue(value: Value!, type: 'v');
                            },
                            valid: (String? value) {
                              if (!value!.checkTryPars) {
                                return 'Vérifiez votre saisie';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          CustomInputButton(
                            onPressed: () {
                              var x = _formpro.currentState;
      
                              if (x!.validate()) {
                                x.save();
                                value.updateAcidite(
                                    Get.arguments["id"], Get.arguments["index"]);
                              }
                              // x!.save();
                            },
                            title: 'Calcul',
                          ),
                          const SizedBox(height: 40),
                          Text(
                            value.result,
                            // result != null ? '${result!.toStringAsFixed(12)}' : '',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
