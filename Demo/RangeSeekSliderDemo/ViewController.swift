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
}
