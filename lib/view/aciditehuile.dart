import 'package:dosage/customertools/methodecalcul.dart';
import 'package:dosage/extensions/number_verifier.dart';
import 'package:flutter/material.dart';

import '../customertools/customer_widget.dart';

class aciditeHuile extends StatefulWidget {
  aciditeHuile({Key? key}) : super(key: key);

  @override
  State<aciditeHuile> createState() => _aciditeHuileState();
}

class _aciditeHuileState extends State<aciditeHuile> {
  GlobalKey<FormState> _formpro = new GlobalKey<FormState>();
  double? masseEch;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formpro,
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Text(
                'L\'ACIDITÉ DANS UNE HUILE',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 50,
              ),
              CustomInputform(
                title: 'Masse  De L\'echantillon Analysé',
                hint: 'Masse en g',
                onsave: (String? Value) {
                  double myDouble = double.parse(Value!);
                  masseEch = myDouble;
                },
                valid: (String? value) {
                  if (value!.checkTryPars) {
                    return 'Vérifiez votre saisie';
                  }
                  return null;
                },
              ),
              CustomInputButton(
                onPressed: () {
                  var x = _formpro.currentState;

                  if (x!.validate()) {
                    x.save();
                    if ('h' != null) {
                      print('he');
                    }
                  }
                  // x!.save();
                },
                title: 'Calcul',
              ),
              Text(
                'hi',
                // result != null ? '${result!.toStringAsFixed(12)}' : '',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
