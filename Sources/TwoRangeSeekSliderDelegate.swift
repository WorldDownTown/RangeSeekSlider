//
//  TwoRangeSeekSliderDelegate.swift
//  RangeSeekSlider
//
//  Created by Jean-Nicolas DEFOSSE on 15/03/18.
//

import CoreGraphics

public protocol TwoRangeSeekSliderDelegate: class {
    
    /// Called when the RangeSeekSlider values are changed
    ///
    /// - Parameters:
    ///   - slider: RangeSeekSlider
    ///   - minValue: minimum value
    ///   - maxValue: maximum value
    func rangeSeekSlider(_ slider: TwoRangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat)
    
    /// Called when the user has started interacting with the RangeSeekSlider
    ///
    /// - Parameter slider: RangeSeekSlider
    func didStartTouches(in slider: TwoRangeSeekSlider)
    
    /// Called when the user has finished interacting with the RangeSeekSlider
    ///
    /// - Parameter slider: RangeSeekSlider
    func didEndTouches(in slider: TwoRangeSeekSlider)
    
    /// Called when the RangeSeekSlider values are changed. A return `String?` Value is displayed on the `minLabel`.
    ///
    /// - Parameters:
    ///   - slider: RangeSeekSlider
    ///   - minValue: minimum value
    /// - Returns: String to be replaced
    func rangeSeekSlider(_ slider: TwoRangeSeekSlider, stringForMinValue minValue: CGFloat) -> String?
    
    /// Called when the RangeSeekSlider values are changed. A return `String?` Value is displayed on the `idealLabel`.
    ///
    /// - Parameters:
    ///   - slider: RangeSeekSlider
    ///   - idealValue: ideal value
    /// - Returns: String to be replaced
    func rangeSeekSlider(_ slider: TwoRangeSeekSlider, stringForIdealValue idealValue: CGFloat) -> String?
    
    /// Called when the RangeSeekSlider values are changed. A return `String?` Value is displayed on the `maxLabel`.
    ///
    /// - Parameters:
    ///   - slider: RangeSeekSlider
    ///   - maxValue: maximum value
    /// - Returns: String to be replaced
    func rangeSeekSlider(_ slider: TwoRangeSeekSlider, stringForMaxValue: CGFloat) -> String?
}


// MARK: - Default implementation

public extension TwoRangeSeekSliderDelegate {
    
    func rangeSeekSlider(_ slider: TwoRangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {}
    func didStartTouches(in slider: TwoRangeSeekSlider) {}
    func didEndTouches(in slider: TwoRangeSeekSlider) {}
    func rangeSeekSlider(_ slider: TwoRangeSeekSlider, stringForMinValue minValue: CGFloat) -> String? { return nil }
    func rangeSeekSlider(_ slider: TwoRangeSeekSlider, stringForIdealValue idealValue: CGFloat) -> String? { return nil }
    func rangeSeekSlider(_ slider: TwoRangeSeekSlider, stringForMaxValue maxValue: CGFloat) -> String? { return nil }
}
