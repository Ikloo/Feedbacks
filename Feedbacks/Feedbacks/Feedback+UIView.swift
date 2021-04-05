//
//  Feedbacks.swift
//  Feedbacks
//
//  Created by Kirill Budevich on 7/10/19.
//

public extension Feedback where Base: UIView {
    func custom(_ feedback: FeedbackStyle...) {
        feedback.forEach({ $0.execute(in: base) })
    }

    // MARK: HapticsFeedbackStyle
    func impact(_ impact: Haptics.Impact) {
        custom(HapticsFeedbackStyle(impact: impact, notification: nil, sound: nil))
    }

    func sound(_ sound: Haptics.Sound) {
        custom(HapticsFeedbackStyle(impact: nil, notification: nil, sound: sound))
    }

    func taptic(_ notification: Haptics.Notification) {
        custom(HapticsFeedbackStyle(impact: nil, notification: notification, sound: nil))
    }

    func hapticSelection() {
        custom(HapticsFeedbackStyle(impact: nil, notification: .selection, sound: .selection))
    }

    // MARK: TransformFeedbackStyle
    func identity() {
        custom(TransformFeedbackStyle(transform: .identity))
    }

    func scale(x: CGFloat, y: CGFloat) {
        custom(TransformFeedbackStyle(transform: CGAffineTransform(scaleX: x, y: y)))
    }

    func rotate(_ angle: CGFloat) {
        custom(TransformFeedbackStyle(transform: CGAffineTransform(rotationAngle: angle)))
    }

    // MARK: PositionFeedbackStyle
    func shake(axis: PositionFeedbackStyle.Axis) {
        custom(PositionFeedbackStyle(offset: 5, repeatsCount: 3, axis: axis))
    }

    // MARK: ColorFeedbackStyle
    func background(_ color: UIColor, backToDefault: Bool = false) {
        custom(ColorFeedbackStyle(color: color, style: .background, backToDefault: backToDefault))
    }
    
    func border(_ color: UIColor, width: CGFloat, backToDefault: Bool = false) {
        custom(ColorFeedbackStyle(color: color, style: .border(width), backToDefault: backToDefault))
    }
}
