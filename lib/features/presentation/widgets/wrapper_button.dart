import 'package:flutter/cupertino.dart';

class WrapperButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final Alignment? alignment;

  const WrapperButton(
      {Key? key, required this.child, this.onPressed, this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      alignment: alignment ?? Alignment.centerLeft,
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      minSize: 0,
      child: child,
    );
  }
}
