import 'package:flutter/material.dart';

class NumericSetepper extends StatefulWidget {
  final int minValue;
  final int maxValue;

  final ValueChanged<int> onChanged;

  const NumericSetepper(
      {Key? key,
      this.minValue = 1,
      this.maxValue = 10,
      required this.onChanged})
      : super(key: key);

  @override
  State<NumericSetepper> createState() {
    return _NumericSetepperState();
  }
}

class _NumericSetepperState extends State<NumericSetepper> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: Icon(
            Icons.remove,
            color: Theme.of(context).colorScheme.primary,
          ),
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
          iconSize: 36.0,
          onPressed: () {
            setState(() {
              if (counter > widget.minValue) {
                counter--;
              }
              widget.onChanged(counter);
            });
          },
        ),
        Text(
          '$counter',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.primary,
          ),
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
          iconSize: 32.0,
          onPressed: () {
            setState(() {
              if (counter < widget.maxValue) {
                counter++;
              }
              widget.onChanged(counter);
            });
          },
        ),
      ],
    );
  }
}
