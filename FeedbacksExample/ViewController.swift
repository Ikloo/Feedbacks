//
//  ViewController.swift
//  Feedbacks
//
//  Created by Kirill Budevich on 07/07/2019.
//  Copyright (c) 2019 Kirill Budevich. All rights reserved.
//

import UIKit
import Feedbacks

class ViewController: UIViewController {
    @IBOutlet var transformAndHapticButton: FeedbackButton! {
        didSet {
            transformAndHapticButton.setupFeedback()
        }
    }
    @IBOutlet var rotatingView: UIView!
    @IBOutlet var emailTextField: UITextField! {
        didSet {
            emailTextField.delegate = self
            emailTextField.layer.borderColor = UIColor.gray.cgColor
            emailTextField.layer.borderWidth = 1
        }
    }

    @IBAction func rotateButtonDidClick(_ sender: Any) {
        rotatingView.fck.rotate(rotatingView.transform.angle + (.pi / 2))
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text,
            let range = Range(range, in: currentText) else { return true }

        let updatedText = currentText.replacingCharacters(in: range, with: string)
        switch updatedText.count {
        case 1...10:
            textField.fck.correctInput()
        case 0:
            break
        default:
            textField.fck.incorrectInput()
        }

        return true
    }
}

class FeedbackButton: UIButton {
    func setupFeedback() {
        addTarget(self, action: #selector(touchDownFeedback), for: .touchDown)
        addTarget(self, action: #selector(touchUpFeedback), for: .touchUpInside)
        addTarget(self, action: #selector(touchUpFeedback), for: .touchUpOutside)
    }
}

extension CGAffineTransform {
    var angle: CGFloat {
        return atan2(b, a)
    }
}
