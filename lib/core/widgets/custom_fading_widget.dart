import 'package:flutter/cupertino.dart';

class CustomFadingWidget extends StatefulWidget {
  final Widget child;
  const CustomFadingWidget({required this.child, super.key});

  @override
  State<CustomFadingWidget> createState() => _CustomFadingWidgetState();
}

class _CustomFadingWidgetState extends State<CustomFadingWidget>  with SingleTickerProviderStateMixin{
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration( milliseconds:800));

    animation = Tween<double>(begin: .2, end: .8).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });
animationController.repeat(reverse: true);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.child,
    );

  }
}
