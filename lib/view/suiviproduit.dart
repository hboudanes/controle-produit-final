import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../controller/suiviproduitcontroller.dart';
import '../customertools/customer_widget.dart';
import '../extensions/number_verifier.dart';
import 'package:flutter/services.dart';

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
              onPressed: () async {
                if (viewmodule.produitFini.isNotEmpty) {
                  print('3amar');
                  showLoaderDialog(context);
                  await viewmodule.createExcel();
                  Navigator.pop(context);
                } else {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.INFO,
                    animType: AnimType.BOTTOMSLIDE,
                    title:
                        'pour importer  fichier excel, ajoutez d\'abord le produit\?',
                    btnCancelText: 'Annuler',
                    btnCancelOnPress: () {},
                  )..show();
                }
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
                          onPressed: () async {
                            if (_textFieldController.text.checkTryPars) {
                              showLoaderDialog(context);
                              double myDouble =
                                  double.parse(_textFieldController.text);
                              viewmodule.updateList(
                                  index, myDouble, 'humidite');
                              await viewmodule.updatehumidite(
                                  viewmodule.produitFini.elementAt(index).id!,
                                  myDouble);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            }
                          },
                        ).displayTextInputDialog();
                      },
                      title: 'Humidité',
                      pourcentrage:
                          viewmodule.produitFini.elementAt(index).humidite,
                    ),
                    ListProduit(
                      onPressed: () {
                        Get.toNamed(
                          '/dosagematieregrasse',
                          arguments: {
                            "id": viewmodule.produitFini.elementAt(index).id,
                            "index": index,
                            "jp": viewmodule.produitFini.elementAt(index).jp,
                          },
                        );
                      },
                      title: 'matiereGrasse',
                      pourcentrage:
                          viewmodule.produitFini.elementAt(index).matiereGrasse,
                    ),
                    CustomInputButton(
                      onPressed: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.INFO,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Voulez-vous supprimer ce produit\?',
                          btnCancelText: 'Annuler',
                          btnOkText: 'Oui',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () async {
                            showLoaderDialog(context);
                            await viewmodule.deleteProduitd(
                                viewmodule.produitFini.elementAt(index).id!,
                                index);
                            Navigator.pop(context);
                          },
                        )..show();
                      },
                      title: 'Delete',
                    ),
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
              keyboardType: TextInputType.number,
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
