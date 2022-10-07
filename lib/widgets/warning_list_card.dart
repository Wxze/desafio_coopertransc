import 'package:flutter/material.dart';

class WarningListCard extends StatelessWidget {
  final String title;
  final String message;
  const WarningListCard(this.title, this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 3,
        child: ClipPath(
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      color: const Color(0xFF1A5650).withOpacity(0.75),
                      width: 5)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.warning, color: Color(0xFF1A5650)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xFF000D0C),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Column(
                  children: [
                    Text(message,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            color: Color(0xFF000D0C), fontSize: 14))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
