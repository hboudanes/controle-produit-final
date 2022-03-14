import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomInputform extends StatelessWidget {
  final String? title;
  final String? hint;
  final String? Function(String?)? valid;
  final String? Function(String?)? onsave;
  const CustomInputform(
      {Key? key, this.title, this.hint, this.valid, this.onsave})
      : super(key: key);
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

// ignore: must_be_immutable
class CustomInputButton extends StatelessWidget {
  final String? title;
  void Function()? onPressed;
  CustomInputButton({Key? key, this.title, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: onPressed,
        child: Text(title!));
  }
}

class ListProduit extends StatelessWidget {
  String? pourcentrage ;
  String? title;
  void Function()? onPressed;
  ListProduit({ this.pourcentrage,required this.title, required this.onPressed});
  
  checkinput(String? input) {
    if (input != null && input.isNotEmpty) {
      return input;
    }
    return '--';
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(checkinput(pourcentrage) ),
      subtitle: Text('${title}%'),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: onPressed,
      ),
    );
  }
}

class CustomListProduit extends StatelessWidget {
  String? proteine;
  String? matiereGrasse;
  String? cendres;
  String? humidite;
  String? acidite;
  CustomListProduit({
    String? proteine,
    String? matiereGrasse,
    String? cendres,
    String? humidite,
    String? acidite,
  }) {
    this.proteine = checkinput(proteine);
    this.matiereGrasse = checkinput(matiereGrasse);
    this.cendres = checkinput(cendres);
    this.humidite = checkinput(humidite);
    this.acidite = checkinput(acidite);
  }
  checkinput(String? input) {
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

// class TextFieldDate extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     return _TextFieldDate ();
//   }
// }

// class _TextFieldDate  extends State<TextFieldDate>{
//   TextEditingController dateinput = TextEditingController();
//   //text editing controller for text field

//   // @override
//   // void initState() {
//   //   dateinput.text = ""; //set the initial value of text field
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
class TextFieldDate extends StatelessWidget {
  TextEditingController dateinput = TextEditingController();
  final String? title;
  final String? hint;
  final String? Function(String?)? valid;
  final String? Function(String?)? onsave;

  TextFieldDate({this.onsave, this.title, this.hint, this.valid});

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
        controller: dateinput, //editing controller of this TextField

        decoration: InputDecoration(
          hintText: hint,
        ),
        readOnly: true,
        onSaved: onsave,
        validator: valid,
        //set it true, so that user will not able to edit text
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              locale: Locale('fr'),
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(
                  2010), //DateTime.now() - not to allow to choose before today.
              lastDate: DateTime(2040));

          if (pickedDate != null) {
            // print(
            //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            // print(
            //     formattedDate); //formatted date output using intl package =>  2021-03-16
            //you can implement different kind of Date Format here according to your requirement

            dateinput.text =
                formattedDate; //set output date to TextField value.

          } else {
            print("Date is not selected");
          }
        },
      ),
    ]);
  }
}
