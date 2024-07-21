import 'package:flutter/material.dart';

class HyperLinkButton extends StatelessWidget {
  const HyperLinkButton({
    super.key,
    this.onPressed,
    required this.title,
    this.isBig = false,
  });

  final void Function()? onPressed;
  final String title;
  final bool isBig;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: isBig
            ? const EdgeInsets.symmetric(horizontal: 0)
            : const EdgeInsets.symmetric(horizontal: 16).add(EdgeInsets.only(bottom: 8)),
        child: Text(title,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  decoration: TextDecoration.underline,
                  fontSize: isBig ? 18 : 16,
                  fontWeight: isBig ? FontWeight.bold : FontWeight.normal,
                  fontStyle: FontStyle.italic,
                )),
      ),
    );
  }
}
