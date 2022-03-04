import '../controller/teneurcontroller.dart';
import '../customertools/customer_widget.dart';
import '../extensions/number_verifier.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class teneurcendre extends StatelessWidget {
  static const route = '/cendre';
  teneurcendre({Key? key}) : super(key: key);
  GlobalKey<FormState> _formpro = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TeneurController viewmodule = Get.put(TeneurController());
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
                  'DOSAGE DES CENDRES BRUTES',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 50,
                ),
                GetBuilder<TeneurController>(
                    
                    builder: (value) {
                      return Column(
                        children: [
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
                                value.results;
                              }
                              // x!.save();
                            },
                            title: 'Calcul',
                          )
                        ],
                      );
                    }),
                SizedBox(height: 40),
                Obx(
                  () {
                    return Text(
                      viewmodule.result.value,
                      style: TextStyle(fontSize: 20),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
