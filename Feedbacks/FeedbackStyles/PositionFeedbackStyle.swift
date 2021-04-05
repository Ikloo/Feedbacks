//
//  PositionFeedbackStyle.swift
//  Feedbacks
//
//  Created by Kirill Budevich on 7/10/19.
//

import UIKit

public struct PositionFeedbackStyle: FeedbackStyle {
    public enum Axis {
        case x, y
    }

    private let offset: CGFloat
    private let repeatsCount: Int
    private let axis: Axis

    public init(offset: CGFloat, repeatsCount: Int, axis: Axis) {
        self.offset = offset
        self.repeatsCount = repeatsCount
        self.axis = axis
    }

    public func execute(in view: UIView) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.\(axis)")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = Float(repeatsCount)
        animation.duration = 0.2 / TimeInterval(repeatsCount)
        animation.autoreverses = true
        animation.values = [offset, -offset]
        view.layer.add(animation, forKey: "position-\(axis)")
    }
}
