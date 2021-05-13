//
//  TransformFeedbackStyle.swift
//  Feedbacks
//
//  Created by Kirill Budevich on 7/7/19.
//

import UIKit.UIView

public struct TransformFeedbackStyle: FeedbackStyle {
    private let transform: CGAffineTransform

    public init(transform: CGAffineTransform) {
        self.transform = transform
    }

    public func execute(in view: UIView) {
        UIView.animate(withDuration: 0.2) {
            view.transform = self.transform
        }
    }
}
