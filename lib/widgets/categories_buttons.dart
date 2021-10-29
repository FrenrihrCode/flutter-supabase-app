import 'package:flutter/material.dart';

class CategoriesButtons extends StatelessWidget {
  const CategoriesButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(onPressed: () => {}, child: const Text("category 1")),
        TextButton(onPressed: () => {}, child: const Text("category 2")),
        TextButton(onPressed: () => {}, child: const Text("category 3"))
      ],
    );
  }
}
