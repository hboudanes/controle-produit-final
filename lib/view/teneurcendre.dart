import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cendrescontroller.dart';
import '../customertools/customer_widget.dart';
import '../extensions/number_verifier.dart';

class TeneurCendre extends StatelessWidget {
  static const route = '/cendre';
  TeneurCendre({Key? key}) : super(key: key);
  GlobalKey<FormState> _formpro = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formpro,
            child: GetBuilder<CendresController>(
                init: CendresController(),
                builder: (value) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      Text(
                        'DOSAGE DES CENDRES BRUTES jp: ${Get.arguments["jp"]}',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CustomInputform(
                        title: 'Masse  De L\'echantillon Analysé',
                        hint: 'Masse en g',
                        onsave: (String? Value) {
                          value.saveValue(value: Value!, type: 'me');
                        },
                        valid: (String? value) {
                          if (!value!.checkTryPars) {
                            return 'Vérifiez votre saisie';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      CustomInputform(
                        title: 'La Masse De Creuset Vide',
                        hint: 'Masse en g',
                        onsave: (String? Value) {
                          value.saveValue(value: Value!, type: 'mc');
                        },
                        valid: (String? value) {
                          if (!value!.checkTryPars) {
                            return 'Vérifiez votre saisie';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      CustomInputform(
                        title:
                            'La Masse De Creuset Après Chauffage à 550 degrés',
                        hint: 'Masse en g',
                        onsave: (String? Value) {
                          value.saveValue(value: Value!, type: 'mcc');
                        },
                        valid: (String? value) {
                          if (!value!.checkTryPars) {
                            return 'Vérifiez votre saisie';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      CustomInputButton(
                        onPressed: () {
                          var x = _formpro.currentState;

                          if (x!.validate()) {
                            x.save();
                            value.updateCender(
                                Get.arguments["id"], Get.arguments["index"]);
                          }
                          // x!.save();
                        },
                        title: 'Calculer et Ajouter',
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Pourcentage :' + value.result + "%",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
