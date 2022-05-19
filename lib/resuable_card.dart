import 'package:flutter/material.dart';

class ResuableCard extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ResuableCard(this.colour, this.cardChild);

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colour, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
