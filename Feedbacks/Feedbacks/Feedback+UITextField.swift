//
//  Feedback+UITextField.swift
//  Feedbacks
//
//  Created by Kirill Budevich on 7/10/19.
//

public extension Feedback where Base: UITextField {
    func incorrectInput() {
        taptic(.error)
        shake(axis: .x)
        custom(ColorFeedbackStyle(color: .red, style: .border(1), backToDefault: true))
    }

    func correctInput() {
        custom(ColorFeedbackStyle(color: .green, style: .border(1), backToDefault: true))
    }
}
