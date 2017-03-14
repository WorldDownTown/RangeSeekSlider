//
//  ViewController.swift
//  RangeSeekSliderDemo
//
//  Created by Keisuke Shoji on 2017/03/08.
//
//

import UIKit
import RangeSeekSlider

final class ViewController: UIViewController {

    @IBOutlet fileprivate weak var rangeSlider: RangeSeekSlider!
    @IBOutlet fileprivate weak var rangeSliderCurrency: RangeSeekSlider!
    @IBOutlet fileprivate weak var rangeSliderCustom: RangeSeekSlider!
    @IBOutlet fileprivate weak var rangeSliderCustomString: RangeSeekSlider!

    fileprivate let prices: [Int] = [
        .min, 500, 1_000, 2_000, 3_000, 4_000, 5_000, 6_000, 7_000, 8_000, 9_000,
        10_000, 11_000, 12_000, 13_000, 14_000, 15_000, 16_000, 17_000, 18_000, 19_000,
        20_000, 21_000, 22_000, 23_000, 24_000, 25_000, 26_000, 27_000, 28_000, 29_000,
        30_000, 31_000, 32_000, 33_000, 34_000, 35_000, 36_000, 37_000, 38_000, 39_000,
        40_000, 41_000, 42_000, 43_000, 44_000, 45_000, 46_000, 47_000, 48_000, 49_000,
        50_000, 55_000, 60_000, 65_000, 70_000, 75_000, 80_000, 85_000, 90_000, 95_000,
        100_000, 110_000, 120_000, 130_000, 140_000, 150_000, .max,
        ]

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private func setup() {
        // standard range slider
        rangeSlider.delegate = self

        // currency range slider
        rangeSliderCurrency.delegate = self
        rangeSliderCurrency.minValue = 50.0
        rangeSliderCurrency.maxValue = 150.0
        rangeSliderCurrency.selectedMinValue = 60.0
        rangeSliderCurrency.selectedMaxValue = 140.0
        rangeSliderCurrency.minDistance = 20.0
        rangeSliderCurrency.maxDistance = 80.0
        rangeSliderCurrency.handleColor = .green
        rangeSliderCurrency.handleDiameter = 30.0
        rangeSliderCurrency.selectedHandleDiameterMultiplier = 1.3
        rangeSliderCurrency.numberFormatter.numberStyle = .currency
        rangeSliderCurrency.numberFormatter.locale = Locale(identifier: "en_US")
        rangeSliderCurrency.numberFormatter.maximumFractionDigits = 2
        rangeSliderCurrency.minLabelFont = UIFont(name: "ChalkboardSE-Regular", size: 15.0)!
        rangeSliderCurrency.maxLabelFont = UIFont(name: "ChalkboardSE-Regular", size: 15.0)!

        // custom number formatter range slider
        rangeSliderCustom.delegate = self
        rangeSliderCustom.minValue = 0.0
        rangeSliderCustom.maxValue = 100.0
        rangeSliderCustom.selectedMinValue = 40.0
        rangeSliderCustom.selectedMaxValue = 60.0
        rangeSliderCustom.handleImage = #imageLiteral(resourceName: "custom-handle")
        rangeSliderCustom.selectedHandleDiameterMultiplier = 1.0
        rangeSliderCustom.colorBetweenHandles = .red
        rangeSliderCustom.lineHeight = 10.0
        rangeSliderCustom.numberFormatter.positivePrefix = "$"
        rangeSliderCustom.numberFormatter.positiveSuffix = "M"

        // custom label string range slider
        rangeSliderCustomString.delegate = self
        rangeSliderCustomString.minValue = 0.0
        rangeSliderCustomString.maxValue = CGFloat(prices.count - 1)
        rangeSliderCustomString.selectedMinValue = 0
        rangeSliderCustomString.selectedMaxValue = CGFloat(prices.count - 1)
        rangeSliderCustomString.minDistance = 1.0
        rangeSliderCustomString.handleColor = #colorLiteral(red: 0.9654981494, green: 0.4302981198, blue: 0.698961854, alpha: 1)
        rangeSliderCustomString.minLabelColor = #colorLiteral(red: 0.9654981494, green: 0.4302981198, blue: 0.698961854, alpha: 1)
        rangeSliderCustomString.maxLabelColor = #colorLiteral(red: 0.9654981494, green: 0.4302981198, blue: 0.698961854, alpha: 1)
        rangeSliderCustomString.colorBetweenHandles = #colorLiteral(red: 0.9654981494, green: 0.4302981198, blue: 0.698961854, alpha: 1)
        rangeSliderCustomString.tintColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        rangeSliderCustomString.numberFormatter.locale = Locale.current
        rangeSliderCustomString.numberFormatter.numberStyle = .currency
        rangeSliderCustomString.initialColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
    }

    fileprivate func priceString(value: CGFloat, numberFormatter: NumberFormatter) -> String {
        let index: Int = Int(roundf(Float(value)))
        if index == 0 {
            return "Min"
        } else if index == prices.count - 1 {
            return "Max"
        } else {
            let priceString: String? = numberFormatter.string(from: prices[index] as NSNumber)
            return priceString ?? ""
        }
    }
}


// MARK: - RangeSeekSliderDelegate

extension ViewController: RangeSeekSliderDelegate {

    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        if slider === rangeSlider {
            print("Standard slider updated. Min Value: \(minValue) Max Value: \(maxValue)")
        } else if slider === rangeSliderCurrency {
            print("Currency slider updated. Min Value: \(minValue) Max Value: \(maxValue)")
        } else if slider === rangeSliderCustom {
            print("Custom slider updated. Min Value: \(minValue) Max Value: \(maxValue)")
        }
    }

    func didStartTouches(in slider: RangeSeekSlider) {
        print("did start touches")
    }

    func didEndTouches(in slider: RangeSeekSlider) {
        print("did end touches")
    }

    func rangeSeekSlider(_ slider: RangeSeekSlider, stringForMinValue minValue: CGFloat) -> String? {
        guard slider == rangeSliderCustomString else { return nil }

        return priceString(value: minValue, numberFormatter: rangeSliderCustomString.numberFormatter)
    }

    func rangeSeekSlider(_ slider: RangeSeekSlider, stringForMaxValue maxValue: CGFloat) -> String? {
        guard slider == rangeSliderCustomString else { return nil }

        return priceString(value: maxValue, numberFormatter: rangeSliderCustomString.numberFormatter)
    }
}
