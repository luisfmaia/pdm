import 'package:e_food/theme/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String _label;
  final VoidCallback? callback;

  const Button({Key? key, required String label, VoidCallback? onPressed})
      : _label = label,
        callback = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: Key(_label),
      onPressed: callback,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(height: 40),
        child: Center(
          child: Text(
            _label,
            style: const TextStyle(
                color: AppColors.white, fontSize: 21, fontFamily: 'BebasNeue'),
          ),
        ),
      ),
    );
  }
}
