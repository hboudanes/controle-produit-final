import 'package:dosage/extensions/number_verifier.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/suiviproduitcontroller.dart';
import '../customertools/customer_widget.dart';

class SuiviProduit extends StatelessWidget {
  // const SuiviProduit({Key? key}) : super(key: key);
  static const route = '/';
  SuiviProduitController viewmodule = Get.put(SuiviProduitController());
  TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SUIVI QUALITE PRODUIT"),
        leading: IconButton(
            onPressed: () {
              Get.toNamed('/addproduit');
            },
            icon: const Icon(Icons.add)),
        actions: [
          IconButton(
              onPressed: () {
                viewmodule.createExcel();
              },
              icon: Icon(Icons.download)),
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
          () {
            return ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                viewmodule.isExpanded[index] = !isExpanded;
              },
              children: List.generate(
                viewmodule.produitFini.length,
                (index) => ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(
                          '${viewmodule.produitFini.elementAt(index).dateProduction} / ${viewmodule.produitFini.elementAt(index).jp}'),
                      subtitle: const Text('Date De Production/J.P'),
                    );
                  },
                  //  Text('${viewmodule.produitFini.elementAt(index).dateProduction}')

                  body: Column(children: [
                    ListProduit(
                      onPressed: () {
                        Get.toNamed(
                          '/Dosagepr',
                          arguments: {
                            "id": viewmodule.produitFini.elementAt(index).id,
                            "index": index,
                            "jp": viewmodule.produitFini.elementAt(index).jp,
                          },
                        );
                      },
                      title: 'proteine',
                      pourcentrage:
                          viewmodule.produitFini.elementAt(index).proteine,
                    ),
                    // cendres
                    ListProduit(
                      onPressed: () {
                        Get.toNamed(
                          '/cendre',
                          arguments: {
                            "id": viewmodule.produitFini.elementAt(index).id,
                            "index": index,
                            "jp": viewmodule.produitFini.elementAt(index).jp,
                          },
                        );
                      },
                      title: 'cendres',
                      pourcentrage:
                          viewmodule.produitFini.elementAt(index).cendres,
                    ),
                    ListProduit(
                      onPressed: () {
                        Get.toNamed(
                          '/acidite',
                          arguments: {
                            "id": viewmodule.produitFini.elementAt(index).id,
                            "index": index,
                            "jp": viewmodule.produitFini.elementAt(index).jp,
                          },
                        );
                      },
                      title: 'acidité',
                      pourcentrage:
                          viewmodule.produitFini.elementAt(index).acidite,
                    ),
                    ListProduit(
                      onPressed: () {
                        TextInputDialog(
                          textFieldController: _textFieldController,
                          onPressed: ()async {
                            if (_textFieldController.text.checkTryPars)  {
                              double myDouble =
                                  double.parse(_textFieldController.text);
                              viewmodule.updateList(
                                  index, myDouble, 'humidite');
                             await viewmodule.updatehumidite(
                                  viewmodule.produitFini.elementAt(index).id!,
                                  myDouble);
                              Navigator.pop(context);
                            }
                          },
                        ).displayTextInputDialog();
                      },
                      title: 'Humidité',
                      pourcentrage:
                          viewmodule.produitFini.elementAt(index).humidite,
                    )
                  ]),
                  isExpanded: viewmodule.isExpanded[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TextInputDialog {
  TextEditingController textFieldController;
  String? errorText;
  void Function() onPressed;
  TextInputDialog(
      {required this.textFieldController,
      this.errorText,
      required this.onPressed});
  Future<void> displayTextInputDialog() {
    return Get.defaultDialog(
        title: 'Dosage de l\’Humidité',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: textFieldController,
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: InputDecoration(
                  errorText: errorText,
                  labelText: 'Humidité En Procentage',
                  hintMaxLines: 1,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 4.0))),
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: Text(
                'Modifié',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            )
          ],
        ),
        radius: 10.0);
  }
}
