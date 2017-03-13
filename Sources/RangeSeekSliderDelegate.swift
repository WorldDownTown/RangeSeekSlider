//
//  RangeSeekSliderDelegate.swift
//  RangeSeekSlider
//
//  Created by Keisuke Shoji on 2017/03/09.
//
//

import CoreGraphics

public protocol RangeSeekSliderDelegate: class {

    /// Called when the RangeSlider values are changed
    ///
    /// - Parameters:
    ///   - slider: RangeSeekSlider
    ///   - minValue: minimum value
    ///   - maxValue: maximum value
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat)

    /// Called when the user has started interacting with the RangeSlider
    ///
    /// - Parameter slider: RangeSeekSlider
    func didStartTouches(in slider: RangeSeekSlider)

    /// Called when the user has finished interacting with the RangeSlider
    ///
    /// - Parameter slider: RangeSeekSlider
    func didEndTouches(in slider: RangeSeekSlider)
}


// MARK: - Default implementation

public extension RangeSeekSliderDelegate {

    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {}
    func didStartTouches(in slider: RangeSeekSlider) {}
    func didEndTouches(in slider: RangeSeekSlider) {}
}
