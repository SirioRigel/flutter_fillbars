<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
# Fillbars

`flutter_fillbars` is a simple flutter package that allows you to create a container animatedely 
fills up when the value changes.

## Contents

- [Installation](#installation)
- [Usage](#usage)
  - [Custom fillbar](#custom-fillbars)
  - [Static fillbar](#static-fillbars)
  - [Animated fillbar](#animated-fillbar)


## Installation

To do.

## Usage

A Fillbar is highly customizable. However I've create a few presets that will you pick the Fillbar which suits your needs. Here are some usage examples

```dart
//  Creates an half full Fillbar
const Fillbar(value: 50, width: 100, height: 20, fillColor: Colors.blue,)

// Creates a full Fillbar. If not given, the fillColor is set to the primary color.
const Fillbar.static(value: 100, width: 100, height: 20)
```

### Custom fillbars

The following code shows a custom fillbar. 

```dart
const Fillbar(
  value: 78,
  height: 20,
  width: 120,
  fillColor: Colors.blue,
  backgroundColor: Colors.grey,
  externalMargin: EdgeInsets.all(10),
  borderPadding: EdgeInsets.all(3),
  borderWidth: 1.3,
  radius: 12,
)
```

![A custom Fillbar](assets/img.png)

### Static fillbars

A static Fillbar the simplest type of Fillbar: it doesn't have an animation. This is made so you don't have to esplicitely put `curve = null` or `duration = null` if you don't want any animation.
Note that a value is required to be passed.

```dart
// Creates a full Fillbar
const Fillbar.static(value: 100, width: 100, height: 20, fillColor: Colors.amber)
```

### Animated fillbar

A fillbar can also be animated: the following code shows how to create a fully animated fillbar which, everytime the value is changed, will react by animating the fill process.

```dart
// Creates an animated 
```

Here is the result:

![A fully animated fillbar](assets/Animation.mp4)

## Additional information

Please share and star this repository if you liked it. 
If you want, you can even contribute, just open a pull-request and I'll be more than happy to review it.

## RoadMad

- :heavy_check_mark: Static fillbar
- :heavy_check_mark: Animated fillbar
- Periodic fillbar