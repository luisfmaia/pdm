import 'package:e_food/theme/colors.dart';
import 'package:flutter/material.dart';

class NumberInput extends StatefulWidget {
  final ValueChanged<int>? _onValueChanged;

  const NumberInput({Key? key, required ValueChanged<int>? onValueChanged})
      : _onValueChanged = onValueChanged,
        super(key: key);

  @override
  State<NumberInput> createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  int quant = 1;

  void decrement() {
    if (quant > 1) {
      widget._onValueChanged!(quant - 1);
      setState(() {
        quant -= 1;
      });
    }
  }

  void increment() {
    if (quant < 99) {
      widget._onValueChanged!(quant + 1);
      setState(() {
        quant += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Text(
              'QUANTIDADE',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
              constraints: const BoxConstraints.tightFor(height: 40),
              decoration: const BoxDecoration(
                color: AppColors.grayLight,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      width: 50,
                      child: Text(
                        quant.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: decrement,
                        icon: const Icon(Icons.remove),
                      ),
                      IconButton(
                        onPressed: increment,
                        icon: const Icon(Icons.add),
                      )
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
