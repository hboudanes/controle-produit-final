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
      appBar: AppBar(
        title: Text("SUIVI QUALITE PRODUIT"),
        leading:IconButton(
              onPressed: () {
                
              },
              icon:const Icon(Icons.add)),
        
      ),
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
                          '${value.produitFini.elementAt(index).dateProduction} / ${value.produitFini.elementAt(index).jp}'),
                      subtitle: const Text('Date De Production/J.P'),
                    );
                  },
                  //  Text('${value.produitFini.elementAt(index).dateProduction}')

                  body: Text('hel'),
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
