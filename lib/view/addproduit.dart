import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/addproduitcontroller.dart';
import '../customertools/customer_widget.dart';
import '../controller/suiviproduitcontroller.dart';
import '../extensions/number_verifier.dart';

class AddProduit extends StatelessWidget {
  static const route = '/addproduit';
  AddProduit({Key? key}) : super(key: key);
  GlobalKey<FormState> _formpro = new GlobalKey<FormState>();
  SuiviProduitController viewmodule = Get.put(SuiviProduitController());
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
                const SizedBox(
                  height: 120,
                ),
                const Text(
                  'Ajoute un nouveau produit fini',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 50,
                ),
                GetBuilder<AddProduitController>(
                    init: AddProduitController(),
                    builder: (value) {
                      return Column(children: [
                        SizedBox(height: 30),
                        TextFieldDate(
                          hint: 'Enter Date',
                          title: 'Date de produiction',
                          valid: (String? Value) {
                            if (Value == null || Value.isEmpty) {
                              return 'Vérifiez votre saisie';
                            }
                            return null;
                          },
                          onsave: (String? Value) {
                            value.getDate(Value!);
                          },
                        ),
                        SizedBox(height: 30),
                        CustomInputform(
                          title: 'J.P',
                          hint: '------',
                          onsave: (String? Value) {
                            value.getJp(Value!);
                          },
                          valid: (String? Value) {
                            if (!Value!.checkTryPars) {
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
                              value.addProduit();
                              Get.offAllNamed('/');
                              viewmodule.initProduitFini();
                            }
                          },
                          title: 'Ajoute',
                        ),
                      ]);
                    }),
                SizedBox(height: 40),
                // Obx(
                //   () {
                //     return Text(
                //       viewmodule.result.value,
                //       style: TextStyle(fontSize: 20),
                //     );
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
