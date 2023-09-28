library flutter_fillbars;
import 'dart:async';
import "package:flutter/material.dart";

class Fillbar extends StatefulWidget {

  /// Creates a Fillbar
  const Fillbar({
    this.value,
    this.height = 12,
    this.width = 85,
    this.fillColor,
    Key? key
  }) : super(key: key);

  /// Generates a static Fillbar which is not animated.
  /// ```dart
  /// Fillbar.static(value: 100, width: 200)
  /// ```
  /// This is simple half full Fillbar.
  const Fillbar.static({
    required this.value,
    this.height = 12,
    this.width = 85,
    this.fillColor,
    Key? key
  }) : super(key: key);

  /// This is the value (in logical pixels) of the amount filled of the Fillbar
  /// itself.
  /// ```dart
  /// Fillbar.static(value: 100, width: 200)
  /// ```
  /// This creates a simple static Fillbar that is half full. It is also
  /// possible to pass a value to it that changes throughout the course of the
  /// application lifecycle. The Fillbar will be automatically updated.
  /// If the value is greater than the constraints given by the flutter framework,
  /// the widget will adjust itself to the maxWidth allowed.
  final double? value;

  /// Specifies the external heigth of the Fillbar. Note that this value cannot exceed
  /// the flutter framework's constraints and will be set to maxHeight if
  /// it does so.
  /// Giving an height which is bigger than the Fillbar's maxHeight will cause
  /// the height to be set to the constraints max height.
  /// ```dart
  /// Container(
  ///   height: 15
  ///   child: Fillbar.static(value: 100, height: 20) // value overflow => height = maxHeight
  /// )
  /// ```
  /// This will create a full Fillbar with an height of 15.
  final double? height;

  /// Specifies the Fillbar's maxWidth. Note that this value cannot exceed
  /// the flutter framework's constraints and will be set to maxWidth if
  /// it does so.
  /// Giving a width which is smaller than the Fillbar's passed value will cause
  /// the width to be set to the value itself.
  /// ```dart
  /// Fillbar.static(value: 100, width: 50) // value overflow => value = width.
  /// ```
  /// This will create a full Fillbar with a value and width of 50.
  final double? width;

  /// The Fillbar's fill color. This color is used to paint the Fillbar's fill
  /// area. If this value is null this property will use the current theme's primary
  /// color.
  final Color? fillColor;

  @override
  State<Fillbar> createState() => _FillbarState();
}

class _FillbarState extends State<Fillbar> {

  late double value;
  late double width;
  late double height;
  late Color fillColor;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if((widget.value ?? 0) > constraints.maxWidth) {
          value = constraints.maxWidth;
        } else {
          if((widget.value ?? 0) >= (widget.width ?? 0)) {
            value = (widget.width ?? 0);
          } else {
            value = widget.value ?? 0;
          }
        }
        if((widget.width ?? 0) > constraints.maxWidth) {
          width = constraints.maxWidth;
        } else {
          width = widget.width ?? 0;
        }
        if((widget.height ?? 0) > constraints.maxHeight) {
          height = constraints.maxWidth;
        } else {
          height = widget.height ?? 0;
        }
        if(widget.fillColor == null) {
          fillColor = Theme.of(context).colorScheme.primary;
        } else {
          fillColor = widget.fillColor!;
        }
        return Container(
          width: width,
          height: height,
          child: Row(
            children: [
              Container(
                width: value,
                decoration: BoxDecoration(
                  color: fillColor
                ),
              )
            ],
          ),
        );
      }
    );
  }
}