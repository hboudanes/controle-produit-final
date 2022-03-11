import 'package:dosage/database.dart';
import 'package:dosage/model/produitfini.dart';
import 'package:flutter/material.dart';

class teu extends StatelessWidget {
  teu({Key? key}) : super(key: key);
  Deze c = Deze();
  int i = 1;
  var fido = ProduitFini(
    id: 0,
    dateProduction: '22/03/2',
    jp: 35,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        ElevatedButton(
            onPressed: () async {
              print('nombre d repetition I');
              print(i);
              await c.creatProduit(fido);

              print(await c.allProduit());
              i++;
            },
            child: Text('insert'))
      ]),
    );
  }
}
