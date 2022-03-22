import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/DosageMatierController.dart';
import '../customertools/customer_widget.dart';
import '../extensions/number_verifier.dart';

class DosageMatiereGrasse extends StatelessWidget {
  static const route = '/dosagematieregrasse';
  DosageMatiereGrasse({Key? key}) : super(key: key);
  GlobalKey<FormState> _formpro = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formpro,
            child: GetBuilder<DosageMatierController>(
                init: DosageMatierController(),
                builder: (value) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      Text(
                        'Dosage De La Matière Grasse J.P: ${Get.arguments["jp"]}',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CustomInputform(
                        title: 'Masse De La Prise D’essai',
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
                      SizedBox(height: 30),
                      CustomInputform(
                        title: 'Masse Du Bécher Sec',
                        hint: 'Masse en g',
                        onsave: (String? Value) {
                          value.saveValue(value: Value!, type: 'ms');
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
                        title: 'Masse Du Bécher Après Extraction',
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
                      CustomInputButton(
                        onPressed: () {
                          var x = _formpro.currentState;

                          if (x!.validate()) {
                            x.save();

                            value.updateMatiereGrasse(
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
