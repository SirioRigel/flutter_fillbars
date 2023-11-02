# Fillbars

`flutter_fillbars` is a simple flutter package that allows you to create a container which
fills animatedly.

## Contents

- [Installation](#installation)
- [Usage](#usage)
  - [Custom fillbar](#custom-fillbars)
  - [Static fillbar](#static-fillbars)
  - [Animated fillbar](#animated-fillbar)
  - [Periodic fillbar](#periodic-fillbar)
  - [Circular fillbar](#circular-fillbar)
- [Examples](#examples)
- [Additional information](#additional-information)


## Installation

Get this package by running this line in your local terminal:
```dart
$ flutter pub add flutter_fillbars: ^1.0.0
```

Or by adding this to pubspec.yaml:
```dart
flutter_fillbars: ^1.0.0
```

## Usage

A Fillbar is highly customizable. However I've create a few presets that will let you pick the Fillbar which suits your needs. Here are some usage examples

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
  text: null
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
// Creates an animated fillbar
const Fillbar(
  value: value,
  height: 30,
  width: 180,
  fillColor: Colors.blue,
  backgroundColor: Colors.grey,
  radius: 12,
  direction: Direction.toRight,
  duration: Duration(seconds: 2),
  curve: Curves.easeOutCubic,
  text: null
)
```

Here is the result:

![A fully animated fillbar](assets/Animation.mp4)

### Periodic fillbar

Creates an animated fillbar with a specific periodicity.  
```dart
// Creates a periodic fillbar
Fillbar.periodic(
  value: value,
  height: 30,
  width: 180,
  fillColor: Colors.blue,
  backgroundColor: Colors.grey,
  radius: 12,
  direction: Direction.toRight,
  text: null
)
```

![A periodic fillbar](assets/periodic.mp4)

### Circular fillbar
Creates an circular fillbar with a specific fill direction and a radius.
Note that the value property should be between 0 - 2*PI (0 - 6.28...).
```dart
// Creates a simple circular fillbar
Fillbar.circular(
  value: math.pi *  13 / 8,
   radius: 50
)
```

![A circular fillbar](assets/circular_fillbar.png)

## Examples

See [examples](example) for some basic examples.

## Additional information

Please share and star this repository if you liked it. 
If you want, you can even contribute, just open a pull-request and I'll be more than happy to review it.

[Follow me on twitter](https://twitter.com/sirio_rigel)
<a href="https://www.buymeacoffee.com/tommasomiliani" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

## RoadMad

- :heavy_check_mark: Static fillbar
- :heavy_check_mark: Animated fillbar
- :heavy_check_mark: Periodic fillbar
- :heavy_check_mark: Simple Example
- :heavy_check_mark: Text over fillbar
- :heavy_check_mark: Package up on Pub.dev
- :heavy_check_mark: Added a circular fillbar
- [] Add a color gradient in fill area