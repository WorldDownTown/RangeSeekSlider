//
//  TapticEngine.swift
//  RangeSeekSlider
//
//  Created by Keisuke Shoji on 2017/04/09.
//
//

import UIKit

struct TapticEngine {

    enum Style {
        case light, medium, heavy, selection, success, warning, error
    }

    static func feedback(_ style: Style = .light) {
        switch style {
        case .light, .medium, .heavy:
            feedbackImpact(style)
        case .selection:
            feedbackSelection()
        case .success, .warning, .error:
            feedbackNotification(style)
        }
    }

    private static func feedbackImpact(_ style: Style) {
        guard #available(iOS 10.0, *) else { return }

        let feedbackStyle: UIImpactFeedbackStyle
        switch style {
        case .light:
            feedbackStyle = .light
        case .medium:
            feedbackStyle = .medium
        case .heavy:
            feedbackStyle = .heavy
        default:
            return
        }

        let feedbackGenerator: UIImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: feedbackStyle)
        feedbackGenerator.prepare()
        feedbackGenerator.impactOccurred()
    }

    private static func feedbackSelection() {
        guard #available(iOS 10.0, *) else { return }

        let feedbackGenerator: UISelectionFeedbackGenerator = UISelectionFeedbackGenerator()
        feedbackGenerator.prepare()
        feedbackGenerator.selectionChanged()
    }

    private static func feedbackNotification(_ style: Style) {
        guard #available(iOS 10.0, *) else { return }

        let feedbackType: UINotificationFeedbackType
        switch style {
        case .success:
            feedbackType = .success
        case .warning:
            feedbackType = .warning
        case .error:
            feedbackType = .error
        default:
            return
        }

        let feedbackGenerator: UINotificationFeedbackGenerator = UINotificationFeedbackGenerator()
        feedbackGenerator.prepare()
        feedbackGenerator.notificationOccurred(feedbackType)
    }
}
