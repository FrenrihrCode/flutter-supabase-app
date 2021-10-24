import 'package:flutter/material.dart';

class ColorsButtonSelector extends StatefulWidget {
  const ColorsButtonSelector({Key? key}) : super(key: key);

  @override
  _ColorsButtonSelectorState createState() => _ColorsButtonSelectorState();
}

class _ColorsButtonSelectorState extends State<ColorsButtonSelector> {
  final _colorList = {
    "green": Colors.green,
    "red": Colors.red,
    "blue": Colors.blue
  };
  String selectedColor = "green";

  Widget _colorBtn(String key, MaterialColor? color) => GestureDetector(
        onTap: () => {
          setState(() => {selectedColor = key})
        },
        child: Container(
          padding: const EdgeInsets.all(3),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
              color: selectedColor == key ? Colors.white : color,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                  color: selectedColor == key
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                  width: 1)),
          child: Icon(
            Icons.circle,
            color: color,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
        children: _colorList.keys
            .map((key) => _colorBtn(
                  key,
                  _colorList[key],
                ))
            .toList());
  }
}
