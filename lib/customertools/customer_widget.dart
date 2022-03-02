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
