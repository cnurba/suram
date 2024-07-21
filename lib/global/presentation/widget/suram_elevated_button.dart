import 'package:flutter/material.dart';

class SuramElevatedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const SuramElevatedButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          alignment: Alignment.center,
          side: WidgetStateProperty.all(BorderSide(
              width: 1,
              color: Theme.of(context).buttonTheme.colorScheme!.primary)),
          padding: WidgetStateProperty.all(
            const EdgeInsets.only(right: 75, left: 75, top: 12.5, bottom: 12.5),
          ),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: Theme.of(context).buttonTheme.colorScheme!.primary,
            fontSize: 16),
      ),
    );
  }
}
