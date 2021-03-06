import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../extensions/number_verifier.dart';
import '../controller/proteinecontroller.dart';
import '../customertools/customer_widget.dart';

class DosageProteines extends StatelessWidget {
  static const route = '/Dosagepr';
  DosageProteines({Key? key}) : super(key: key);
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
                  'Dosage Protéines (Kjeldahl) J.P: ${Get.arguments["jp"]}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 50,
                ),
                GetBuilder<ProteineController>(
                    init: ProteineController(),
                    builder: (value) {
                      return Column(children: [
                        CustomInputform(
                          title: 'Masse exacte de l\'echantillon analysé',
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
                          title: 'Volume cerse de HCI 0,1 N',
                          hint: 'Volume en ml',
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
                              value.updateProteine(
                                  Get.arguments["id"], Get.arguments["index"]);
                            }
                          },
                          title: 'Calculer et Ajouter',
                        ),
                        SizedBox(height: 40),
                        Text(
                          'Pourcentage :' + value.result + "%",
                          style: TextStyle(fontSize: 20),
                        ),
                      ]);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
