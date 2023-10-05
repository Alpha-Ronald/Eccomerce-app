import 'package:flutter/material.dart';

class CountController extends StatefulWidget {
  const CountController(
      {super.key,
      required this.decrementIconBuilder,
      required this.incrementIconBuilder,
      required this.countBuilder,
      required this.count,
      required this.updateCount,
      this.stepSize = 1,
      this.minimum,
      this.maximum,
      required this.contentPadding});

  final Widget Function(bool enabled) decrementIconBuilder;
  final Widget Function(bool enabled) incrementIconBuilder;
  final Widget Function(int count) countBuilder;
  final int count;
  final Function(int) updateCount;
  final int stepSize;
  final int? minimum;
  final int? maximum;
  final EdgeInsetsGeometry contentPadding;

  @override
  CountControllerState createState() => CountControllerState();
}

class CountControllerState extends State<CountController> {
  int get count => widget.count;

  int? get minimum => widget.minimum;

  int? get maximum => widget.maximum;

  int? get stepSize => widget.stepSize;

  bool get canDecrement => minimum == null || count - stepSize! >= minimum!;

  bool get canIncrement => maximum == null || count - stepSize! <= maximum!;

  void decrementCounter() {
    if (canDecrement) {
      setState(() => widget.updateCount(count - stepSize!));
    }
  }

  void incrementCounter() {
    if (canIncrement) {
      setState(() => widget.updateCount(count + stepSize!));
    }
  }

  @override
  Widget build(BuildContext context) => Padding(
      padding: widget.contentPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: decrementCounter,
              child: widget.decrementIconBuilder(canDecrement)),
          widget.countBuilder(count),
          InkWell(
            onTap: incrementCounter,
            child: widget.incrementIconBuilder(canIncrement),
          )
        ],
      ));
}
