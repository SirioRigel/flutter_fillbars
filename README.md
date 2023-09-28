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

`flutter_fillbars` is a simple flutter package that allows you to create a containers 
that fills up over time or by assigning a value variable.

## Contents

- [Installation](#installation)
- [Usage](#usage)
  - [Static fillbar](#static-fillbars)


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

### Static fillbars

A static Fillbar the simplest type of Fillbar: it doesn't need an animation. Note that a value is required to be passed.

```dart
// Creates a full Fillbar
const Fillbar.static(value: 100, width: 100, height: 20, fillColor: Colors.amber)
```

## Additional information

Please share and star this repository if you liked it. 
If you want, you can even contribute, just open a pull-request and I'll be more than happy to review it.

## RoadMad

- [X] Static fillbar
- [-] Timed fillbar
- [-] Periodic fillbar