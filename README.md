# RangeSeekSlider

[![Join the chat at https://gitter.im/WorldDownTown/RangeSeekSlider](https://badges.gitter.im/WorldDownTown/RangeSeekSlider.svg)](https://gitter.im/WorldDownTown/RangeSeekSlider?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![License](https://img.shields.io/:license-mit-blue.svg)](https://doge.mit-license.org)
[![Language](https://img.shields.io/badge/language-swift-orange.svg?style=flat)](https://developer.apple.com/swift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/RangeSeekSlider.svg?style=flat)](http://cocoadocs.org/docsets/RangeSeekSlider/)
[![Downloads with CocoaPods](https://img.shields.io/cocoapods/dt/RangeSeekSlider.svg)](http://cocoadocs.org/docsets/RangeSeekSlider/)
[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/matteocrippa/awesome-swift#ui)

## Overview
`RangeSeekSlider` provides a customizable range slider like a UISlider.
This library is based on [TomThorpe/TTRangeSlider](https://github.com/TomThorpe/TTRangeSlider) (Objective-C) and made with Swift.

![demo](images/demo.gif)

## Demo
You can try on [Appetize.io](https://appetize.io/app/v3pzcncpffgth3qqe1v8a1ktg4)

or

Build Xcode project.

1. Open RangeSeekSlider.xcodeproj.
2. Change Scheme to `RangeSeekSliderDemo`
3. Run

## Usage
Add the RangeSeekSlider like you would with any other UIControl. Either:
- Add a view in your storyboard/xib and change its `Class` and `Module` to `RangeSeekSlider`.  You can set all the properties in the Attributes Inspector and see a live preview:

![Interface Builder Module Screenshot](images/interface_builder_module.png)

![Interface Builder Screenshot](images/interface_builder.png)

or

- Create the `RangeSeekSlider` in code using `RangeSeekSlider()` then add it as a subview to your code and set the relevant autolayout properties or frame.

The default slider ranges from 0.0 -> 100.0 and has 10.0 preselected as the minimum, and 90.0 as the maximum.

Values that the user has selected are exposed using the `selectedMinValue` and `selectedMaxValue` properties. You can also use these properties to change the selected values programatically if you wish.

Other customisation of the control is done using the following properties:

#### `tintColor`
The tintColor property (which you can also set in Interface Builder) sets the overall color of the control, including the color of the line, the two handles, and the labels.

It is safe to change the `tintColor` at any time, if the control is currently visible the color change will be animated into the new color.

#### `minValue`
The minimum possible value to select in the range

#### `maxValue`
The maximum possible value to select in the range

#### `selectedMinValue`
The preselected minumum value (note: This should be less than the selectedMaxValue)

#### `selectedMaxValue`
The preselected maximum value (note: This should be greater than the selectedMinValue)

#### `minLabelFont`
The font of the minimum value text label. If not set, the default is system font size `12.0`.

#### `maxLabelFont`
The font of the maximum value text label. If not set, the default is system font size `12.0`.

#### `numberFormatter`
Each handle in the slider has a label above it showing the current selected value. If you change number format, update each properties of `NumberFormatter`. By default, this is displayed as a decimal format.

#### `hideLabels`
When set to `true` the labels above the slider controls will be hidden. Default is `false`.

#### `labelsFixed`
Fixes the labels above the slider controls. If `true`, labels will be fixed to both ends. Otherwise labels will move with the handles. Default is `false`.

#### `minDistance`
The minimum distance the two selected slider values must be apart. Default is `0.0`.

#### `maxDistance`
The maximum distance the two selected slider values must be apart. Default is `CGFloat.greatestFiniteMagnitude`.

#### `minLabelColor`
The color of the minimum value text label. If not set, the default is the tintColor.

#### `maxLabelColor`
The color of the maximum value text label. If not set, the default is the tintColor.

#### `handleColor`
If set it will update the color of the handles. Default is `tintColor`.

#### `colorBetweenHandles`
The colorBetweenHandles property sets the color of the line between the two handles.

#### `handleBorderColor`
If set it will update the color of the handle borders. Default is `tintColor`.

### `initialColor`
The color of the entire slider when the handle is set to the minimum value and the maximum value. Default is nil.

#### `disableRange`
If `true`, the control will mimic a normal slider and have only one handle rather than a range.

In this case, the selectedMinValue will be not functional anymore. Use selectedMaxValue instead to determine the value the user has selected.

#### `enableStep`
If `true` the control will snap to point at each `step` (property) between minValue and maxValue. Default value is disabled.

#### `step`
If `enableStep` is `true`, this controls the value of each step. E.g. if this value is 20, the control will snap to values 20,40,60...etc. Set this is you enable the `enableStep` property.

#### `handleImage`
If set the image passed will be used for the handles.

#### `handleDiameter`
If set it will update the size of the handles. Default is `16.0`.

#### `selectedHandleDiameterMultiplier`
If set it update the scaling factor of the handle when selected. Default is `1.7`. If you don't want any scaling, set it to `1.0`.

#### `lineHeight`
Set the height of the line. It will automatically round the corners. If not specified, the default value will be `1.0`.

#### `handleBorderWidth`
If set it will update the size of the handle borders. Default is `0.0`

#### `labelPadding`
If set it will update the size of the padding between label and handle. Default is `8.0`

#### `minLabelAccessibilityLabel`
The label displayed in accessibility mode for minimum value handler. If not set, the default is empty String.

#### `maxLabelAccessibilityLabel`
The label displayed in accessibility mode for maximum value handler. If not set, the default is empty String.

#### `minLabelAccessibilityHint`
The brief description displayed in accessibility mode for minimum value handler. If not set, the default is empty String.

#### `maxLabelAccessibilityHint`
The brief description displayed in accessibility mode for maximum value handler. If not set, the default is empty String.

#### `func setupStyle()`
When subclassing `RangeSeekSlider` and setting each item in `setupStyle()`, the design is reflected in Interface Builder as well.
![setup_style.gif](images/setup_style.gif)

## Requirements
- Swift 3.0+
- iOS 9.0+

## Installation

### Carthage
RangeSeekSlider is available through [Carthage](https://github.com/Carthage/Carthage). To install it, simply add the following line to your Cartfile:

```
github "WorldDownTown/RangeSeekSlider"
```

#### ⚠️Warning⚠️
When installed with Carthage, `@IBDesignable` can't be available ([Carthage Issue](https://github.com/Carthage/Carthage/issues/335)). But we have a workaround is shown in [Stack Overflow](http://stackoverflow.com/a/37631860/1835227). It is able to use `@IBDesignable` by subclassing `RangeSeekSlider`.

```swift
@IBDesignable class CustomRangeSeekSlider: RangeSeekSlider {}
```


### CocoaPods
RangeSeekSlider is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'RangeSeekSlider'
```

### Manually
Download and drop `RangeSeekSlider/Sources` folder in your project.

## Author
WorldDownTown, WorldDownTown@gmail.com

## License
RangeSeekSlider is available under the MIT license. See the LICENSE file for more info.

