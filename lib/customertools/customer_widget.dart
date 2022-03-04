import 'package:flutter/material.dart';

class CustomInputform extends StatelessWidget {
  final String? title;
  final String? hint;
  final String? Function(String?)? valid;
  final String? Function(String?)? onsave;
  CustomInputform({this.title, this.hint, this.valid, this.onsave});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          alignment: Alignment.topLeft,
          child: Text(
            title!,
            style: Theme.of(context).textTheme.headline6,
          )),
      TextFormField(
        onSaved: onsave,
        validator: valid,
        decoration: InputDecoration(hintText: hint),
      ),
    ]);
  }
}

class CustomInputButton extends StatelessWidget {
  final String? title;
  void Function()? onPressed;
  CustomInputButton({this.title, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(50),
        ),
        onPressed: onPressed,
        child: Text(title!));
  }
}

class CustomListProduit extends StatelessWidget {
  String? proteine;
  String? matiereGrasse;
  String? cendres;
  String? humidite;
  String? acidite;
  var test;
  CustomListProduit({
    required String proteine,
    required String matiereGrasse,
    required String cendres,
    required String humidite,
    required String acidite,
  
  }) {

    this.proteine = checkinput(proteine);
    this.matiereGrasse = checkinput(matiereGrasse);
    this.cendres = checkinput(cendres);
    this.humidite = checkinput(humidite);
    this.acidite = checkinput(acidite);
  }
  checkinput(String input) {
    print(input != null);
    print(input.isEmpty);
    if (input != null && input.isNotEmpty) {
      return input;
    }
    return '--';
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        title: Text(proteine!),
        subtitle: const Text('Proteine%'),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {},
        ),
      ),
      ListTile(
        title: Text(matiereGrasse!),
        subtitle: const Text('MatiereGrasse%'),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {},
        ),
      ),
      ListTile(
        title: Text(cendres!),
        subtitle: const Text('cendres%'),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {},
        ),
      ),
      ListTile(
        title: Text(humidite!),
        subtitle: const Text('humidite%'),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {},
        ),
      ),
      ListTile(
        title: Text(acidite!),
        subtitle: const Text('acidite%'),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {},
        ),
      )
    ]);
  }
}
