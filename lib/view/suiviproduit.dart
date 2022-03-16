import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/suiviproduitcontroller.dart';
import '../customertools/customer_widget.dart';

class SuiviProduit extends StatelessWidget {
  // const SuiviProduit({Key? key}) : super(key: key);
  static const route = '/';
  // SuiviProduitController viewmodule = Get.put(SuiviProduitController());
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
      ),
      body: SingleChildScrollView(
        child: GetX<SuiviProduitController>(
          init: SuiviProduitController(),
          builder: (value) {
            return ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                value.isExpanded[index] = !isExpanded;
              },
              children: List.generate(
                value.produitFini.length,
                (index) => ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(
                          '${value.produitFini.elementAt(index).dateProduction} / ${value.produitFini.elementAt(index).jp}'),
                      subtitle: const Text('Date De Production/J.P'),
                    );
                  },
                  //  Text('${value.produitFini.elementAt(index).dateProduction}')

                  body: Column(children: [
                    ListProduit(
                      onPressed: () {
                        
                        Get.toNamed(
                          '/Dosagepr',
                          arguments: {
                            "id": value.produitFini.elementAt(index).id,
                            "index":index,
                            "jp":value.produitFini.elementAt(index).jp,
                          },
                        );
                      },
                      title: 'proteine',
                      pourcentrage:value.produitFini.elementAt(index).proteine,
                    ),
                    // cendres
                    ListProduit(
                      onPressed: () {
                        
                        Get.toNamed(
                          '/cendre',
                          arguments: {
                            "id": value.produitFini.elementAt(index).id,
                            "index":index,
                            "jp":value.produitFini.elementAt(index).jp,
                          },
                        );
                      },
                      title: 'cendres',
                      pourcentrage:value.produitFini.elementAt(index).cendres,
                    )
                  ]),
                  isExpanded: value.isExpanded[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
