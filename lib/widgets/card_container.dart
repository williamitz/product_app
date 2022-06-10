import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({
    Key? key, 
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      // height: 400,
      decoration: _buildDecoration(),
      child: child
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
              blurRadius: 15, color: Colors.black12, offset: Offset(0, 5))
        ]
    );
  }
}
