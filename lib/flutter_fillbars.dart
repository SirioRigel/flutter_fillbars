library flutter_fillbars;
import "package:flutter/material.dart";
import "dart:math" as math;

enum Direction {
  toRight, toLeft, toTop, toBottom, clockWise, antiClockWise
}

class Fillbar extends StatefulWidget {

  /// Creates a Fillbar
  const Fillbar({
    required this.value,
    this.radius = 0,
    this.height = 17,
    this.width = 100,
    this.text = const Text("0"),
    this.fillColor,
    this.fillColorGradient,
    this.rotationAngle = 0,
    this.rotationPivot = Alignment.center,
    this.rotationDuration = const Duration(seconds: 2),
    this.rotationCurve = Curves.easeOutCubic,
    this.isRotationPeriodic = false,
    this.backgroundColor = const Color(0xFFCDCDCD),
    this.borderColor = const Color(0x00000000),
    this.paddingColor = const Color(0x00000000),
    this.externalMargin = const EdgeInsets.all(8),
    this.borderPadding = const EdgeInsets.all(2),
    this.borderWidth = 1.3,
    this.borderRadius = 12,
    this.direction = Direction.toRight,
    this.duration = const Duration(seconds: 2),
    this.curve = Curves.easeOutCubic,
    this.periodic = false,
    Key? key
  }) : super(key: key);

  /// Generates a static Fillbar set to a specific value.
  /// ```dart
  /// Fillbar.static(value: 100, width: 200)
  /// ```
  /// This is simple half full Fillbar.
  const Fillbar.static({
    required this.value,
    this.radius = 0,
    this.height = 17,
    this.width = 100,
    this.text = const Text("0"),
    this.fillColor,
    this.fillColorGradient,
    this.rotationAngle = 0,
    this.rotationPivot = Alignment.center,
    this.backgroundColor = const Color(0xFFCDCDCD),
    this.borderColor = const Color(0x00000000),
    this.paddingColor = const Color(0x00000000),
    this.externalMargin = const EdgeInsets.all(8),
    this.borderPadding = const EdgeInsets.all(2),
    this.borderWidth = 1.3,
    this.borderRadius = 12,
    this.direction = Direction.toRight,
    Key? key
  }) : duration = null,
       curve = null,
       periodic = false,
       rotationDuration = null,
       rotationCurve = null,
       isRotationPeriodic = false,
       super(key: key);

  /// Creates a periodic Fillbar which will be animated forever with a periodicity of
  /// 2 times the duration of the animation.
  /// ```dart
  /// Fillbar.periodic(value: 40)
  /// ```
  /// The fillbar will be filled to a value of 40, which is 40%, and then will be
  /// emptied periodically every animation cycle.
  const Fillbar.periodic({
    required this.value,
    this.radius = 0,
    this.height = 17,
    this.width = 100,
    this.text = const Text("0"),
    this.fillColor,
    this.fillColorGradient,
    this.rotationAngle = 0,
    this.rotationPivot = Alignment.center,
    this.rotationDuration = const Duration(seconds: 2),
    this.rotationCurve = Curves.easeOutCubic,
    this.isRotationPeriodic = false,
    this.backgroundColor = const Color(0xFFCDCDCD),
    this.borderColor = const Color(0x00000000),
    this.paddingColor = const Color(0x00000000),
    this.externalMargin = const EdgeInsets.all(8),
    this.borderPadding = const EdgeInsets.all(2),
    this.borderWidth = 1.3,
    this.borderRadius = 12,
    this.direction = Direction.toRight,
    this.duration = const Duration(seconds: 2),
    this.curve = Curves.easeOutCubic,
    this.periodic = true,
    Key? key
  }) : super(key: key);

  /// Creates a round Fillbar:
  ///```dart
  /// Fillbar.circular(value: math.pi) // Half filled
  /// Fillbar.circular(value: math.pi / 2) // Quarter filled
  /// Fillbar.circular(value: math.pi * 2) // Full
  /// ```
  /// Note that the angle should be passed as a fraction of 2PI. (which is 6.28...)
  const Fillbar.circular({
    required this.value,
    this.radius = 50,
    this.height = 0,
    this.width = 0,
    this.text = const Text("0"),
    this.fillColor,
    this.fillColorGradient,
    this.rotationAngle = 0,
    this.rotationPivot = Alignment.center,
    this.rotationDuration = const Duration(seconds: 2),
    this.rotationCurve = Curves.easeOutCubic,
    this.isRotationPeriodic = false,
    this.backgroundColor = const Color(0xFFCDCDCD),
    this.borderColor = const Color(0x00000000),
    this.paddingColor = const Color(0x00000000),
    this.externalMargin = const EdgeInsets.all(8),
    this.borderPadding = const EdgeInsets.all(2),
    this.borderWidth = 1.3,
    this.borderRadius = 100,
    this.direction = Direction.clockWise,
    this.duration = const Duration(seconds: 2),
    this.curve = Curves.easeOutCubic,
    this.periodic = false,
    Key? key
  }) :  super(key: key);

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
  /// The following example will create a full Fillbar of width 100. The width here
  /// is the property that gets adjusted rather than the value itself because it's
  /// not specified.
  /// ```dart
  /// Fillbar(value: 100) // Full Fillbar of width and value 100.
  /// ```
  final double value;

  /// This property specifies the radius of the circular fillbar. The default value is 25
  /// for a circular fillbar, but zero for a non circular one.
  ///
  /// ```dart
  /// // This is not valid. If radius > 0 the fillbar will be circular
  /// Fillbar(value: 100, radius: 100, width: 200, height 100)
  ///
  /// Fillbar.circular(value: 100, radius: 100)
  /// ```
  /// The way value is calculated depends on the radius: if the value > 2*PI*radius than the
  /// max value will be set to 2*PI*radius. If it's lower, it will be the proportion.
  /// ```dart
  /// // the amount filled will be around 15.9...%
  /// Fillbar.circular(value: 100, radius: 100)
  /// ```
  final double radius;

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
  final double borderRadius;

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
  /// The default curve used for the animation is Curves.easeOutCubic
  final Curve? curve;

  /// Specifies the period of the animation.
  /// ```dart
  /// Fillbar.periodic(value: 40)
  /// ```
  /// The fillbar will be filled to a value of 40, which is 40%, and then will be
  /// emptied periodically every animation cycle.
  final bool periodic;

  /// Adds a text centered over the Fillbar's fill area.
  /// ```dart
  /// Fillbar(value: 100, width: 200, text: null) // nothing shown
  ///
  /// Fillbar(value: 100, width: 200) // 50%
  /// ```
  /// By default this property is not null. It has, in fact, a default value of
  /// Text("0"). If no other value is passed, it will pick the current value of the
  /// Fillbar and will write it as a percentage (int). If it's null, no value is displayed.
  final Text? text;

  /// This property takes a list of colors and creates a linear gradient out of them.
  /// If the Fillbar is circular it will be used a SweepGradient.
  /// ```dart
  /// // Creates a Fillbar where it's fillColor will be a linear gradient
  /// Fillbar(value: 100, fillColorGradient: [Colors.red, Colors.yellow])
  /// ```
  /// If this property is specified, it will be applied to the Fillbar even if a
  /// fillColor has been specified. If both are null, it will be used the primary color
  /// of the current theme.
  final List<Color>? fillColorGradient;

  /// Specifies the angle of rotation of the Fillbar. Note that the angle will be
  /// normalized to a value between 0 and 2 * PI. A negative rotation will make the
  /// Fillbar rotate counterClockwise.
  /// ```dart
  /// // Creates a Fillbar rotated by 30°
  /// Fillbar(value: 100, rotationAngle: math.pi / 6)
  /// ```
  /// Note that the rotation uses the standard rotation for a RotationTransition.
  /// This means that the rotation in the above example will occur pointed towards
  /// the bottom and not the top.
  final double? rotationAngle;

  /// Describes the rotation pivot relative to the box where the Fillbar is inscribed.
  /// An Alignment of (0,0) sets a rotation around the center of the widget.
  /// Using an alignment of (1,-1) sets the rotation around the topRight corner.
  final Alignment? rotationPivot;

  /// Sets the duration of the rotation.
  final Duration? rotationDuration;

  /// Describes the animation curve for the rotation.
  final Curve? rotationCurve;

  /// Specifies weather the rotation should be periodic or be executed just once.
  final bool isRotationPeriodic;

  @override
  State<Fillbar> createState() => _FillbarState();
}

class _FillbarState extends State<Fillbar> with TickerProviderStateMixin{

  late double value;
  late double width;
  late double height;
  late double radius;

  late bool isCircular;
  late bool useGradient;

  late Color fillColor;
  late Gradient gradient;

  late Direction fillDirection;

  late final AnimationController _fillController;
  late final Animation<double> _fillAnimation;

  late final AnimationController _rotationController;
  // late final Animation<double> _rotationAnimation;

  late Text text;

  @override
  void initState() {
    if(widget.fillColorGradient != null) {
      useGradient = true;
    } else {
      useGradient = false;
    }
    if(widget.radius > 0) {
      isCircular = true;
      if(widget.direction != Direction.clockWise && widget.direction != Direction.antiClockWise) {
        fillDirection = Direction.clockWise;
      } else {
        fillDirection = widget.direction;
      }
    } else {
      if(widget.direction == Direction.clockWise || widget.direction == Direction.antiClockWise) {
        fillDirection = Direction.toRight;
      } else {
        fillDirection = widget.direction;
      }
      isCircular = false;
    }
    radius = widget.radius;
    if(widget.duration != null && widget.curve != null) {
      if(widget.periodic) {
        _fillController = AnimationController(
            duration: widget.duration,
            vsync: this
        )..repeat(reverse: true);
      } else {
        _fillController = AnimationController(
            duration: widget.duration,
            vsync: this
        );
      }
      _fillAnimation = CurvedAnimation(
          parent: _fillController,
          curve: widget.curve!
      );
    } else {
      _fillController = AnimationController(
        vsync: this,
        duration: widget.duration ?? Duration.zero
      );
      _fillAnimation = CurvedAnimation(
        curve: Curves.linear,
        parent: _fillController
      );
    }
    if(!widget.periodic) {
      _fillController.forward();
    }
    if(widget.rotationDuration != null && widget.rotationCurve != null) {
      if(widget.isRotationPeriodic) {
        _rotationController = AnimationController(
          vsync: this,
          duration: widget.rotationDuration
        )..repeat(reverse: true);
      } else {
        _rotationController = AnimationController(
            vsync: this,
            duration: widget.rotationDuration
        );
      }
      //_rotationAnimation = Tween(begin: 0.0, end: (widget.rotationAngle ?? 0) / (2 * math.pi)).animate(_rotationController);
    } else {
      _rotationController = AnimationController(
          vsync: this,
          duration: widget.rotationDuration ?? Duration.zero
      );
      //_rotationAnimation = Tween(begin: 0.0, end: (widget.rotationAngle ?? 0) / (2 * math.pi)).animate(_rotationController);
    }
    if(!widget.isRotationPeriodic) {
      if(widget.rotationAngle != 0) {
        _rotationController.forward();
      }
    }
    text = const Text("");
    super.initState();
  }

  @override
  void dispose() {
    _fillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if(_fillController.isCompleted && !widget.periodic) {
      _fillController.reset();
      _fillController.forward();
    }
    if(_rotationController.isCompleted && !widget.isRotationPeriodic) {
      if(widget.rotationAngle != 0) {
        _rotationController.reset();
        _rotationController.forward();
      }
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        if(isCircular) {
          if(widget.radius > constraints.maxWidth) {
            radius = constraints.maxWidth / 2;
          }
          if(widget.radius > constraints.maxHeight) {
            radius = constraints.maxHeight / 2;
          }
          if(widget.value > (2*math.pi*radius)) {
            value = (2*math.pi*radius);
          } else {
            value = widget.value;
          }
        } else {
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
        if(useGradient) {
          double startAngle = 0;
          double endAngle = 0;
          if(fillDirection == Direction.clockWise) {
            startAngle = math.pi * 3 / 2;
          } else {
            startAngle = -(math.pi / 2) + 2 * math.pi - value;
          }
          endAngle = startAngle + 2 * math.pi;
          switch(fillDirection) {
            case Direction.toRight: gradient = LinearGradient(colors: widget.fillColorGradient!, end: Alignment(value / width, value / width));
            break;
            case Direction.toLeft: gradient = LinearGradient(colors: widget.fillColorGradient!, end: Alignment.centerLeft, begin: Alignment.centerRight);
            break;
            case Direction.toTop: gradient = LinearGradient(colors: widget.fillColorGradient!, end: Alignment.topCenter, begin: Alignment.bottomCenter);
            break;
            case Direction.toBottom: gradient = LinearGradient(colors: widget.fillColorGradient!, end: Alignment.bottomCenter, begin: Alignment.topCenter);
            break;
            default: gradient = SweepGradient(colors: widget.fillColorGradient!, startAngle: startAngle, endAngle: endAngle);
          }
        } else {
          if(widget.fillColor == null) {
            fillColor = Theme.of(context).colorScheme.primary;
          } else {
            fillColor = widget.fillColor!;
          }
        }
        if(widget.text != null) {
          if(widget.text!.data == "0") {
            if(fillDirection == Direction.toRight || fillDirection == Direction.toLeft) {
              text = Text(
                "${((value / width) * 100).toInt()} %",
                style: const TextStyle(
                  color: Colors.white
                ),
              );
            } else if(fillDirection == Direction.toTop || fillDirection == Direction.toBottom) {
              text = Text(
                "${((value / height) * 100).toInt()} %",
                style: const TextStyle(
                    color: Colors.white
                ),
              );
            }
          } else {
            text = widget.text!;
          }
        }
        return AnimatedRotation(
          turns: (widget.rotationAngle ?? 0) / (2 * math.pi),
          alignment: widget.rotationPivot ?? Alignment.center,
          duration: widget.rotationDuration ?? Duration.zero,
          curve: widget.rotationCurve == null ? Curves.linear : widget.rotationCurve!,
          child: Container(
            width: isCircular ? radius * 2 : width,
            height: isCircular ? radius * 2 : height,
            padding: widget.borderPadding,
            margin: widget.externalMargin,
            decoration: BoxDecoration(
              shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
              color: widget.paddingColor,
              borderRadius: isCircular ? null : BorderRadius.all(Radius.circular(widget.borderRadius)),
              border: Border.all(
                color: widget.borderColor,
                width: widget.borderWidth
              )
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
                color: widget.backgroundColor,
                borderRadius: isCircular ? null : BorderRadius.all(Radius.circular(widget.borderRadius))
              ),
              child:
              fillDirection == Direction.toRight || fillDirection == Direction.toLeft ?
              Row(
                mainAxisAlignment: fillDirection == Direction.toRight ? MainAxisAlignment.start : MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: SizeTransition(
                      sizeFactor: _fillAnimation,
                      axis: Axis.horizontal,
                      axisAlignment: fillDirection == Direction.toRight ? -1 : 1,
                      child: Container(
                        width: value,
                        decoration: BoxDecoration(
                          color: useGradient ? null : fillColor,
                          gradient: useGradient ? gradient : null ,
                          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius))
                        ),
                        child: Center(
                          child: text
                        ),
                      ),
                    ),
                  )
                ],
              )
              : (fillDirection == Direction.toBottom || fillDirection == Direction.toTop ?
              Column(
                mainAxisAlignment: fillDirection == Direction.toBottom ? MainAxisAlignment.start : MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: SizeTransition(
                      sizeFactor: _fillAnimation,
                      axis: Axis.vertical,
                      axisAlignment: fillDirection == Direction.toBottom ? -1 : 1,
                      child: Container(
                        height: value,
                        decoration: BoxDecoration(
                            color: useGradient ? null : fillColor,
                            gradient: useGradient ? gradient : null,
                            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius))
                        ),
                        child: Center(
                            child: text
                        ),
                      ),
                    ),
                  )
                ],
              ) :
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: CustomPaint(
                      painter: SectorsPainter(value, useGradient ? gradient.colors : [fillColor], fillDirection),
                      size: Size.fromRadius(radius),
                    ),
                  )
                ],
              )),
            ),
          ),
        );
      }
    );
  }
}

class SectorsPainter extends CustomPainter {
  SectorsPainter(
    this.value,
    this.fillColor,
    this.direction
  );
  final double value;
  final List<Color> fillColor;
  final Direction direction;

  late double actualValue;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;

    if(value > (2 * math.pi)) {
      actualValue = 2 * math.pi;
    } else {
      if(value < 0) {
        actualValue = 0;
      } else {
        actualValue = value;
      }
    }

    final double mainCircleDiameter = size.width;
    final arcsRect = Rect.fromLTWH(0, 0, mainCircleDiameter, mainCircleDiameter);

    double startAngle = 0;
    if(direction == Direction.clockWise) {
      startAngle = math.pi * 3 / 2;
    } else {
      startAngle = -(math.pi / 2) + 2 * math.pi - actualValue;
    }

    if(fillColor.length > 1) {
      SweepGradient gradient;
      if(direction == Direction.clockWise) {
        gradient = SweepGradient(colors: fillColor, endAngle: actualValue, transform: const GradientRotation( - math.pi/2),);
      } else {
        gradient = SweepGradient(colors: fillColor.reversed.toList(), endAngle: actualValue, transform: const GradientRotation(math.pi * 3 / 2));
      }
      paint.shader = gradient.createShader(arcsRect);
      canvas.drawArc(arcsRect, startAngle, actualValue, true, paint);
    } else {
      canvas.drawArc(arcsRect, startAngle, actualValue, true,
          paint..color = fillColor[0]);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}