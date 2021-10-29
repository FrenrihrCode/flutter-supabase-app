import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final double position;
  final String value;
  final Color? color;
  const Badge(
      {Key? key,
      required this.child,
      required this.value,
      this.position = 8,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
            top: position,
            right: position,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color ?? Theme.of(context).colorScheme.primaryVariant),
              constraints: const BoxConstraints(minHeight: 16, minWidth: 16),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10),
              ),
            ))
      ],
    );
  }
}