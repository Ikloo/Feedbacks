//
//  TapticEngine.swift
//  Feedbacks
//
//  Created by Kirill Budevich on 7/7/19.
//

import UIKit

final class TapticEngine: HapticsEngine {
    private typealias ImpactGenerator = (light: UIImpactFeedbackGenerator, medium: UIImpactFeedbackGenerator, heavy: UIImpactFeedbackGenerator)

    @available(iOS 10.0, *)
    private lazy var notifictionGenerator = UINotificationFeedbackGenerator()
    @available(iOS 10.0, *)
    private lazy var selectionGenerator = UISelectionFeedbackGenerator()
    @available(iOS 10.0, *)
    private lazy var impactGenerator: ImpactGenerator = (UIImpactFeedbackGenerator(style: .light),
                                                         UIImpactFeedbackGenerator(style: .medium),
                                                         UIImpactFeedbackGenerator(style: .heavy))

    func prepare() {
        //        guard #available(iOS 10, *) else {
        //            Logger.log("Taptic not supported by OS", .warning, group: .api)
        //            return
        //        }

        notifictionGenerator.prepare()
        selectionGenerator.prepare()
        impactGenerator.heavy.prepare()
        impactGenerator.medium.prepare()
        impactGenerator.light.prepare()
    }

    func generate(_ notification: Haptics.Notification) {
        //        guard #available(iOS 10, *) else {
        //            Logger.log("Taptic not supported by OS", .warning, group: .api)
        //            return
        //        }

        switch notification {
        case .success:
            notifictionGenerator.notificationOccurred(.success)
        case .warning:
            notifictionGenerator.notificationOccurred(.warning)
        case .error:
            notifictionGenerator.notificationOccurred(.error)
        case .selection:
            selectionGenerator.selectionChanged()
        }
        prepare()
    }

    func generate(_ impact: Haptics.Impact) {
        //        guard #available(iOS 10, *) else {
        //            Logger.log("Taptic not supported by OS", .warning, group: .api)
        //            return
        //        }

        switch impact {
        case .light:
            impactGenerator.light.impactOccurred()
        case .medium:
            impactGenerator.medium.impactOccurred()
        case .heavy:
            impactGenerator.heavy.impactOccurred()
        }
        prepare()
    }
}
