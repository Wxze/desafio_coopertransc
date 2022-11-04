import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String label;
  final Function onClick;

  const DefaultButton({
    Key? key,
    required this.label,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(55),
          primary: const Color(0xFF1A5650),
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 18),
        ),
        onPressed: () async {
          onClick();
        },
      ),
    );
  }
}
