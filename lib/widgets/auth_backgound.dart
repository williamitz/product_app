import 'package:flutter/material.dart';

class AuthBackgound extends StatelessWidget {
  final Widget child;

  const AuthBackgound({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _PupleBox(), 
          _HeaderIcon(),
          child
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}

class _PupleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      // color: Colors.deepPurple,
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _decorationBox(),
      child: Stack(
        children: [
          Positioned(top: 90, left: 65, child: _buildCircle(90)),
          Positioned(top: -40, left: -30, child: _buildCircle(90)),
          Positioned(top: -50, right: -20, child: _buildCircle(75)),
          Positioned(bottom: -50, left: 10, child: _buildCircle(75)),
          Positioned(bottom: 120, right: 20, child: _buildCircle(75)),
        ],
      ),
    );
  }

  Widget _buildCircle(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 0.05),
          borderRadius: BorderRadius.circular(100)),
    );
  }

  BoxDecoration _decorationBox() {
    return const BoxDecoration(
        gradient: LinearGradient(colors: [
      Color.fromRGBO(63, 63, 156, 1),
      Color.fromRGBO(90, 70, 178, 1)
    ]));
  }
}
