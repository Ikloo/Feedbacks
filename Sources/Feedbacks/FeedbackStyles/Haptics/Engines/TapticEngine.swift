//
//  TapticEngine.swift
//  Feedbacks
//
//  Created by Kirill Budevich on 7/7/19.
//

import UIKit

final class TapticEngine: HapticsEngine {
    private struct ImpactGenerator {
        let impact: Haptics.Impact
        private let generator: UIImpactFeedbackGenerator

        private init(impact: Haptics.Impact, generator: UIImpactFeedbackGenerator) {
            self.impact = impact
            self.generator = generator
        }

        func prepare() {
            generator.prepare()
        }

        func impactOccurred() {
            generator.impactOccurred()
        }

        static func heavy() -> Self { ImpactGenerator(impact: .heavy, generator: .init(style: .heavy)) }
        static func medium() -> Self { ImpactGenerator(impact: .medium, generator: .init(style: .medium)) }
        static func light() -> Self { ImpactGenerator(impact: .light, generator: .init(style: .light)) }

        @available(iOS 13.0, *)
        static func soft() -> Self { ImpactGenerator(impact: .soft, generator: .init(style: .soft)) }
        @available(iOS 13.0, *)
        static func rigid() -> Self { ImpactGenerator(impact: .rigid, generator: .init(style: .rigid)) }
    }

    private lazy var notifictionGenerator = UINotificationFeedbackGenerator()
    private lazy var selectionGenerator = UISelectionFeedbackGenerator()
    private lazy var impactGenerators: [ImpactGenerator] = {
        var generators: [ImpactGenerator] = [.heavy(), .medium(), .light()]
        if #available(iOS 13.0, *) {
            generators.append(contentsOf: [.soft(), .rigid()])
        }
        return generators
    }()

    func prepare() {
        //        guard #available(iOS 10, *) else {
        //            Logger.log("Taptic not supported by OS", .warning, group: .api)
        //            return
        //        }

        notifictionGenerator.prepare()
        selectionGenerator.prepare()
        impactGenerators.forEach { $0.prepare() }
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

        guard let generator = impactGenerators.first(where: { $0.impact == impact }) else {
//            Logger.log("Selected impact \(impact) not available", .warning, group: .api)
            return
        }

        generator.impactOccurred()
        prepare()
    }
}
