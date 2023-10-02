## 0.4.2

- Added text over fillbar:
  - text: if the property is null, no text is shown
- Minor fixes
- Updated example 1 with new code: now the fillbar will react to the floating action button

## 0.4.1

- Minor tweaks to code
- Added a the first package example.
- Tweaks to readme.

## 0.4.0

- Added a periodic fillbar with a new property:
  - periodic:either true or false, it creates a fillbar with a periodic animation if true
- Fixed a bug with the filling animation: at the beginning of the animation the "fill area" would just go 
out of the left bounds.

## 0.3.0 

- Added animation features:
  - duration: sets the duration of the animation
  - curve: sets the type of animation curve to use

- A static fillbar doesn't have a duration or curve property; this ensures that there is no animation

## 0.2.0

- Added "direction" property which it allows to pick a fill direction and it's useful to specify weather the fill bar should be vertical or horizontal: 
  - Direction.toRight: it's the default one, from left to right
  - Direction.toLeft: from right to left
  - Direction.toTop: from bottom to top
  - Direction.toBottom: from top to bottom

## 0.1.0

- Added "background color" property which is used to set the color of the empty part of the bar
- Added some border properties border:
  - borderColor: sets the border's color.
  - paddingColor: sets the color of the space between the fill area and the border
  - externalMargin: sets the margin to other widgets
  - borderPadding: sets the amount of padding between the border and the fillArea
  - borderWidth: sets the width of the border itself
  - radius: sets the Fillbar's border radius (0 = rectangular).

## 0.0.1

- Added a basic static fillbar with a value, width, height and a custom Color.