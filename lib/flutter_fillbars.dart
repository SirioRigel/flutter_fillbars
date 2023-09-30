library flutter_fillbars;
import "package:flutter/material.dart";

enum Direction {
  toRight, toLeft, toTop, toBottom
}

class Fillbar extends StatefulWidget {

  /// Creates a Fillbar
  const Fillbar({
    required this.value,
    this.height = 17,
    this.width = 100,
    this.fillColor,
    this.backgroundColor = const Color(0xFFCDCDCD),
    this.borderColor = const Color(0x00000000),
    this.paddingColor = const Color(0x00000000),
    this.externalMargin = const EdgeInsets.all(8),
    this.borderPadding = const EdgeInsets.all(2),
    this.borderWidth = 1.3,
    this.radius = 12,
    this.direction = Direction.toRight,
    this.duration = const Duration(seconds: 2),
    this.curve = Curves.easeOutCubic,
    Key? key
  }) : super(key: key);

  /// Generates a static Fillbar set to a specific value.
  /// ```dart
  /// Fillbar.static(value: 100, width: 200)
  /// ```
  /// This is simple half full Fillbar.
  const Fillbar.static({
    required this.value,
    this.height = 17,
    this.width = 100,
    this.fillColor,
    this.backgroundColor = const Color(0xFFCDCDCD),
    this.borderColor = const Color(0x00000000),
    this.paddingColor = const Color(0x00000000),
    this.externalMargin = const EdgeInsets.all(8),
    this.borderPadding = const EdgeInsets.all(2),
    this.borderWidth = 1.3,
    this.radius = 12,
    this.direction = Direction.toRight,
    Key? key
  }) : duration = null,
       curve = null,
       super(key: key);

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
  final double value;

  /// Specifies the external height of the Fillbar. Note that this value cannot exceed
  /// the flutter framework's constraints and will be set to maxHeight if
  /// it does so.
  /// Giving an height which is bigger than the Fillbar's maxHeight will cause
  /// the height to be set to the constraints max height.
  /// ```dart
  /// Container(
  ///   height: 15
  ///   child: Fillbar.static(value: 50, height: 20) // value overflow => height = maxHeight
  /// )
  /// ```
  /// This will create a full Fillbar with an height of 15.
  final double height;

  /// Specifies the Fillbar's maxWidth. Note that this value cannot exceed
  /// the flutter framework's constraints and will be set to maxWidth if
  /// it does so.
  /// Giving a width which is smaller than the Fillbar's passed value will cause
  /// the width to be set to the value itself.
  /// ```dart
  /// Fillbar.static(value: 100, width: 50) // value overflow => value = width.
  /// ```
  /// This will create a full Fillbar with a value and width of 50.
  final double width;

  /// The Fillbar's fill color. This color is used to paint the Fillbar's fill
  /// area. If this value is null this property will use the current theme's primary
  /// color.
  final Color? fillColor;

  /// The Fillbar's background color.
  final Color backgroundColor;

  /// The Fillbar's border color: if null, it's transparent.
  final Color borderColor;

  /// This is the color of the space between the outside border and the Fillbar's itself.
  /// The default value is white.
  final Color paddingColor;

  /// The external border margin. This value sets the entire Fillbar's margin,
  /// including the outside frame.
  final EdgeInsetsGeometry externalMargin;

  /// The padding between the fill part and the outside border.
  final EdgeInsetsGeometry borderPadding;

  /// The radius property sets the border radius for each container, both the
  /// external and internal one.
  final double radius;

  /// The external border width.
  final double borderWidth;

  /// Specifies the fill direction:
  /// ```dart
  /// // A Fillbar which is filled from left to right
  /// Fillbar.static(value: 50, width: 100, height: 20, direction: Direction.toRight)
  ///
  /// // A Fillbar which is filled from right to left
  /// Fillbar.static(value: 50, width: 100, height: 20, direction: Direction.toLeft)
  ///
  /// // A Fillbar which fills from top to bottom
  /// Fillbar.static(value: 50, width: 20, height: 100, direction: Direction.toBottom)
  ///
  /// // A Fillbar which fills from bottom to top
  /// Fillbar.static(value: 50, width: 20, height: 100, direction: Direction.toTop)
  /// ```
  final Direction direction;

  /// Specifies the duration of the animation. The default value is 2 seconds
  final Duration? duration;

  /// Sets the type of curve to use when animating the bar filling up.
  /// ```dart
  /// Curves.linear // Linear animation
  /// Curves.easeOutCubic // Fills up and slows at x^3 ratio
  /// Curves.easeInQuadratic // Fills up and speeds up at x^2 ratio
  /// ```
  /// 
  /// The dafault curve used for the animation is Curves.easeOutCubic
  final Curve? curve;

  @override
  State<Fillbar> createState() => _FillbarState();
}

class _FillbarState extends State<Fillbar> with TickerProviderStateMixin{

  late double value;
  late double width;
  late double height;

  late Color fillColor;

  late final AnimationController _fillController;
  late final Animation<double> _fillAnimation;

  @override
  void initState() {
    if(widget.duration != null && widget.curve != null) {
      _fillController = AnimationController(
          duration: widget.duration,
          vsync: this
      );
      _fillAnimation = CurvedAnimation(
          parent: _fillController,
          curve: widget.curve!
      );
    } else {
      _fillController = AnimationController(
        vsync: this,
        duration: Duration.zero
      );
      _fillAnimation = CurvedAnimation(
        curve: Curves.linear,
        parent: _fillController
      );
    }
    _fillController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(_fillController.isCompleted) {
      _fillController.reset();
      _fillController.forward();
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        if(widget.direction == Direction.toRight || widget.direction == Direction.toLeft) {
          if(widget.value > constraints.maxWidth) {
            value = constraints.maxWidth;
          } else {
            if(widget.value >= widget.width) {
              value = widget.width;
            } else {
              value = widget.value;
            }
          }
        } else {
          if(widget.value > constraints.maxHeight) {
            value = constraints.maxHeight;
          } else {
            if(widget.value >= widget.height) {
              value = widget.height;
            } else {
              value = widget.value;
            }
          }
        }
        if(widget.width > constraints.maxWidth) {
          width = constraints.maxWidth;
        } else {
          width = widget.width;
        }
        if(widget.height > constraints.maxHeight) {
          height = constraints.maxWidth;
        } else {
          height = widget.height;
        }
        if(widget.fillColor == null) {
          fillColor = Theme.of(context).colorScheme.primary;
        } else {
          fillColor = widget.fillColor!;
        }
        return Container(
          width: width,
          height: height,
          padding: widget.borderPadding,
          margin: widget.externalMargin,
          decoration: BoxDecoration(
            color: widget.paddingColor,
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            border: Border.all(
              color: widget.borderColor,
              width: widget.borderWidth
            )
          ),
          child: Container(
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(widget.radius))
            ),
            child:
            widget.direction == Direction.toRight || widget.direction == Direction.toLeft ?
            Row(
              mainAxisAlignment: widget.direction == Direction.toRight ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: [
                Flexible(
                  child: SizeTransition(
                    sizeFactor: _fillAnimation,
                    axis: Axis.horizontal,
                    child: Container(
                      width: value,
                      decoration: BoxDecoration(
                        color: fillColor,
                        borderRadius: BorderRadius.all(Radius.circular(widget.radius))
                      ),
                    ),
                  ),
                )
              ],
            )
            : Column(
              mainAxisAlignment: widget.direction == Direction.toBottom ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: [
                Flexible(
                  child: SizeTransition(
                    sizeFactor: _fillAnimation,
                    axis: Axis.vertical,
                    child: Container(
                      height: value,
                      decoration: BoxDecoration(
                          color: fillColor,
                          borderRadius: BorderRadius.all(Radius.circular(widget.radius))
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}