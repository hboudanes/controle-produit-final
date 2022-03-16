import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/suiviproduitcontroller.dart';
import '../customertools/customer_widget.dart';

class SuiviProduit extends StatelessWidget {
  // const SuiviProduit({Key? key}) : super(key: key);
  static const route = '/';
  SuiviProduitController viewmodule = Get.put(SuiviProduitController());
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
                            "index":index,
                            "jp":viewmodule.produitFini.elementAt(index).jp,
                          },
                        );
                      },
                      title: 'proteine',
                      pourcentrage:viewmodule.produitFini.elementAt(index).proteine,
                    ),
                    // cendres
                    ListProduit(
                      onPressed: () {
                        
                        Get.toNamed(
                          '/cendre',
                          arguments: {
                            "id": viewmodule.produitFini.elementAt(index).id,
                            "index":index,
                            "jp":viewmodule.produitFini.elementAt(index).jp,
                          },
                        );
                      },
                      title: 'cendres',
                      pourcentrage:viewmodule.produitFini.elementAt(index).cendres,
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
