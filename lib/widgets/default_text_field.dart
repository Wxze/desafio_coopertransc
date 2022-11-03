import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String label;
  final TextEditingController controllerVariable;
  final IconData icon;
  final bool isPassword;
  final double? fontSize;

  const DefaultTextField(
      {Key? key,
      required this.controllerVariable,
      required this.label,
      required this.isPassword,
      required this.icon,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: TextFormField(
        controller: controllerVariable,
        obscureText: isPassword,
        enableSuggestions: false,
        autocorrect: false,
        style: const TextStyle(
          fontSize: 15,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          contentPadding: const EdgeInsets.all(20),
          labelText: label,
          labelStyle: const TextStyle(fontSize: 16, color: Color(0xFF000D0C)),
          hintText: 'Informe o valor',
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Color(0x77103430),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Icon(icon, color: const Color(0xFF000D0C), size: 24),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Color(0xFF487873),
              width: 2.4,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Color(0xFF103430),
              width: 1.7,
            ),
          ),
        ),
      ),
    );
  }
}
