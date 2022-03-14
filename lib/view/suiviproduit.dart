import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/suiviproduitcontroller.dart';
import '../customertools/customer_widget.dart';

class SuiviProduit extends StatelessWidget {
  const SuiviProduit({Key? key}) : super(key: key);
  static const route = '/';
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
                          '${value.produitFini.elementAt(index).dateProduction} / ${value.produitFini.elementAt(index).jp} /${value.produitFini.elementAt(index).id}'),
                      subtitle: const Text('Date De Production/J.P'),
                    );
                  },
                  //  Text('${value.produitFini.elementAt(index).dateProduction}')

                  body: Column(children: [
                    ListProduit(
                      onPressed: () {
                        print('hello');
                        Get.toNamed(
                          '/Dosagepr',
                          arguments: {
                            "id": value.produitFini.elementAt(index).id,
                            "dateProduction":value.produitFini.elementAt(index).dateProduction,
                            "jp": value.produitFini.elementAt(index).jp,
                          },
                        );
                      },
                      title: 'proteine',
                      pourcentrage:'${value.produitFini.elementAt(index).proteine }',
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
