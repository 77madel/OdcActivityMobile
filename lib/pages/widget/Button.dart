import 'package:flutter/material.dart';
class Mybutton extends StatelessWidget {
  final VoidCallback onTab;
  final String text;
  const Mybutton(
  {
    super.key,
    required this.onTab,
    required this.text
  }
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              gradient: const LinearGradient(colors: [
                Colors.orange, Colors.black87
              ]
              )
          ),
          child:  Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
