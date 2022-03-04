import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/produitcontroller.dart';
import '../view/dosageproteines.dart';
import '../customertools/customer_widget.dart';

class testgetx extends StatelessWidget {
  const testgetx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: GetX<produitcontroller>(
          init: produitcontroller(),
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
                          '${value.produitFini.elementAt(index).dateProduction} / ${value.produitFini.elementAt(index).jP}'),
                      subtitle: const Text('Date De Production/J.P'),
                    );
                  },
                  //  Text('${value.produitFini.elementAt(index).dateProduction}')

                  body: CustomListProduit(
                   
                    proteine:
                        value.produitFini.elementAt(index).proteine.toString(),
                    matiereGrasse: value.produitFini
                        .elementAt(index)
                        .matiereGrasse
                        .toString(),
                    cendres:
                        value.produitFini.elementAt(index).cendres.toString(),
                    humidite:
                        value.produitFini.elementAt(index).humidite.toString(),
                    acidite:
                        value.produitFini.elementAt(index).acidite.toString(),
                  ),
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
