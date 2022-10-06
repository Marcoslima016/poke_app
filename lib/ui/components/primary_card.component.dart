import 'package:flutter/material.dart';

class PrimaryCard extends StatelessWidget {
  Widget child;

  double? marginTop;

  bool _useDefaultMarginTop = true;

  PrimaryCard({
    required this.child,
    this.marginTop,
  }) {
    if (marginTop != null) _useDefaultMarginTop = false;
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height / 100;
    double w = MediaQuery.of(context).size.width / 100;

    return Container(
      margin: EdgeInsets.only(top: _useDefaultMarginTop ? h * 2.2 : marginTop!),
      width: w * 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(1.8, 1.8), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}
