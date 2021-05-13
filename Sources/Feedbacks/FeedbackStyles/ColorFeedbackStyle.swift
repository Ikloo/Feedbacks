//
//  ColorFeedbackStyle.swift
//  Feedbacks
//
//  Created by Kirill Budevich on 7/10/19.
//

import UIKit

public struct ColorFeedbackStyle: FeedbackStyle {
    public enum Style {
        case border(CGFloat), background
    }

    private let color: UIColor
    private let style: Style
    private let backToDefault: Bool

    public init(color: UIColor, style: Style, backToDefault: Bool) {
        self.color = color
        self.style = style
        self.backToDefault = backToDefault
    }

    public func execute(in view: UIView) {
        let propertyAnimator = UIViewPropertyAnimator(duration: 0.2, dampingRatio: 0) {
            switch self.style {
            case .border(let width):
                view.layer.borderColor = self.color.cgColor
                view.layer.borderWidth = width
            case .background:
                view.backgroundColor = self.color
            }
        }

        if backToDefault {
            let defaultValues: (background: UIColor?, border: CGColor?, width: CGFloat) = (view.backgroundColor,
                                                                                           view.layer.borderColor,
                                                                                           view.layer.borderWidth)

            let defaultAnimator = UIViewPropertyAnimator(duration: 2, dampingRatio: 0) {
                view.layer.borderColor = defaultValues.border
                view.layer.borderWidth = defaultValues.width
                view.backgroundColor = defaultValues.background
            }

            propertyAnimator.addCompletion({ _ in
                defaultAnimator.startAnimation()
            })
        }

        propertyAnimator.startAnimation()
    }
}
