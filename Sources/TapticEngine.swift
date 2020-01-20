//
//  TapticEngine.swift
//  RangeSeekSlider
//
//  Created by Keisuke Shoji on 2017/04/09.
//
//

import UIKit

/// Generates iOS Device vibrations by UIFeedbackGenerator.
open class TapticEngine {

    public static let impact: Impact = Impact()
    public static let selection: Selection = Selection()
    public static let notification: Notification = Notification()


    /// Wrapper of `UIImpactFeedbackGenerator`
    open class Impact {

        /// Impact feedback styles
        ///
        /// - light: A impact feedback between small, light user interface elements.
        /// - medium: A impact feedback between moderately sized user interface elements.
        /// - heavy: A impact feedback between large, heavy user interface elements.
        public enum ImpactStyle {
            case light, medium, heavy
        }

        private var style: ImpactStyle = .light
        private var generator: UIImpactFeedbackGenerator = Impact.makeGenerator(.light)

        private static func makeGenerator(_ style: ImpactStyle) -> UIImpactFeedbackGenerator {
            let feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle
            switch style {
            case .light:
                feedbackStyle = .light
            case .medium:
                feedbackStyle = .medium
            case .heavy:
                feedbackStyle = .heavy
            }
            let generator = UIImpactFeedbackGenerator(style: feedbackStyle)
            generator.prepare()
            return generator
        }

        private func updateGeneratorIfNeeded(_ style: ImpactStyle) {
            guard self.style != style else { return }
            generator = Impact.makeGenerator(style)
            self.style = style
        }

        public func feedback(_ style: ImpactStyle) {
            updateGeneratorIfNeeded(style)
            generator.impactOccurred()
            generator.prepare()
        }

        public func prepare(_ style: ImpactStyle) {
            updateGeneratorIfNeeded(style)
            generator.prepare()
        }
    }


    /// Wrapper of `UISelectionFeedbackGenerator`
    open class Selection {

        private var generator: UISelectionFeedbackGenerator = {
            let generator = UISelectionFeedbackGenerator()
            generator.prepare()
            return generator
        }()

        public func feedback() {
            generator.selectionChanged()
            generator.prepare()
        }

        public func prepare() {
            generator.prepare()
        }
    }


    /// Wrapper of `UINotificationFeedbackGenerator`
    open class Notification {

        /// Notification feedback types
        ///
        /// - success: A notification feedback, indicating that a task has completed successfully.
        /// - warning: A notification feedback, indicating that a task has produced a warning.
        /// - error: A notification feedback, indicating that a task has failed.
        public enum NotificationType {
            case success, warning, error
        }

        private var generator: UINotificationFeedbackGenerator = {
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            return generator
        }()

        public func feedback(_ type: NotificationType) {
            let feedbackType: UINotificationFeedbackGenerator.FeedbackType
            switch type {
            case .success:
                feedbackType = .success
            case .warning:
                feedbackType = .warning
            case .error:
                feedbackType = .error
            }
            generator.notificationOccurred(feedbackType)
            generator.prepare()
        }

        public func prepare() {
            generator.prepare()
        }
    }
}
