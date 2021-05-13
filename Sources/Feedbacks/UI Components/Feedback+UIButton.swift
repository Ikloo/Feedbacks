//
//  Feedback+UIButton.swift
//  Feedbacks
//
//  Created by Kirill Budevich on 7/10/19.
//

import UIKit

public extension Feedback where Base: UIButton {
    func touchDown() {
        impact(.heavy)
        scale(x: 0.975, y: 0.96)
    }

    func touchUp() {
        impact(.light)
        identity()
    }
}

public extension UIButton {
    @objc func touchDownFeedback() {
        fck.touchDown()
    }

    @objc func touchUpFeedback() {
        fck.touchUp()
    }
}
