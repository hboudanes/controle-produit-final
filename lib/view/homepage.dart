
import 'package:dosage/customertools/customer_widget.dart';
import 'package:dosage/view/dosageproteines.dart';
import 'package:dosage/view/teneurcendre.dart';
import 'package:flutter/material.dart';


class Homepage extends StatefulWidget {
  static const route = '/';
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                CustomInputButton(
                  title: 'Dosage Protéines (Kjeldahl)',
                  onPressed: () {
                    Navigator.pushNamed(context, Dosageproteines.route);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomInputButton(
                  title: 'DOSAGE DES CENDRES BRUTES',
                  onPressed: () {
                    Navigator.pushNamed(context, teneurcendre.route);
                  },
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
