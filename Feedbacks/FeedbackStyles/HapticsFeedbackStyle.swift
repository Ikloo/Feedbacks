//
//  HapticsFeedbackStyle.swift
//  Feedbacks
//
//  Created by Kirill Budevich on 7/7/19.
//


import UIKit.UIView

public struct HapticsFeedbackStyle: FeedbackStyle {
    private let impact: Haptics.Impact?
    private let notification: Haptics.Notification?
    private let sound: Haptics.Sound?

    public init(impact: Haptics.Impact?, notification: Haptics.Notification?, sound: Haptics.Sound?) {
        self.impact = impact
        self.notification = notification
        self.sound = sound
    }

    public func execute(in view: UIView) {
        if let impact = impact {
            Haptics.generate(impact: impact)
        }
        if let notification = notification {
            Haptics.generate(notification: notification)
        }
        if let sound = sound {
            Haptics.generate(sound: sound)
        }
    }
}
