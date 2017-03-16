//
//  CustomRangeSeekSlider.swift
//  RangeSeekSlider
//
//  Created by Keisuke Shoji on 2017/03/16.
//
//

import UIKit

@IBDesignable final class CustomRangeSeekSlider: RangeSeekSlider {

    fileprivate let prices: [Int] = [
        .min, 500, 1_000, 2_000, 3_000, 4_000, 5_000, 6_000, 7_000, 8_000, 9_000,
        10_000, 11_000, 12_000, 13_000, 14_000, 15_000, 16_000, 17_000, 18_000, 19_000,
        20_000, 21_000, 22_000, 23_000, 24_000, 25_000, 26_000, 27_000, 28_000, 29_000,
        30_000, 31_000, 32_000, 33_000, 34_000, 35_000, 36_000, 37_000, 38_000, 39_000,
        40_000, 41_000, 42_000, 43_000, 44_000, 45_000, 46_000, 47_000, 48_000, 49_000,
        50_000, 55_000, 60_000, 65_000, 70_000, 75_000, 80_000, 85_000, 90_000, 95_000,
        100_000, 110_000, 120_000, 130_000, 140_000, 150_000, .max,
        ]

    override func setupStyle() {
        let pink: UIColor = #colorLiteral(red: 0.0000000000, green: 0.5019607843, blue: 0.0000000000, alpha: 1) // greenCSS3 #008000
        let gray: UIColor = #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1) // gray #808080

        minValue = 0.0
        maxValue = CGFloat(prices.count - 1)
        selectedMinValue = 15.0
        selectedMaxValue = CGFloat(prices.count - 1)
        minDistance = 1.0
        handleColor = pink
        minLabelColor = pink
        maxLabelColor = pink
        colorBetweenHandles = pink
        tintColor = gray
        numberFormatter.locale = Locale(identifier: "ja_JP")
        numberFormatter.numberStyle = .currency
        labelsFixed = true
        initialColor = gray

        delegate = self
    }

    fileprivate func priceString(value: CGFloat) -> String {
        let index: Int = Int(roundf(Float(value)))
        let price: Int = prices[index]
        if price == .min {
            return "Min"
        } else if price == .max {
            return "Max"
        } else {
            let priceString: String? = numberFormatter.string(from: price as NSNumber)
            return priceString ?? ""
        }
    }
}


// MARK: - RangeSeekSliderDelegate

extension CustomRangeSeekSlider: RangeSeekSliderDelegate {

    func rangeSeekSlider(_ slider: RangeSeekSlider, stringForMinValue minValue: CGFloat) -> String? {
        return priceString(value: minValue)
    }

    func rangeSeekSlider(_ slider: RangeSeekSlider, stringForMaxValue maxValue: CGFloat) -> String? {
        return priceString(value: maxValue)
    }
}
