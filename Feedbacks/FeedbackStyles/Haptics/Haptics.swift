//
//  Haptics.swift
//  Feedbacks
//
//  Created by Kirill Budevich on 7/7/19.
//

import AVFoundation
import UIKit

protocol HapticsEngine {
    func prepare()
}

public class Haptics {
    public enum Impact {
        case light
        case medium
        case heavy
    }

    public enum Notification {
        case success
        case warning
        case error
        case selection
    }

    public enum Sound {
        case success, warning, error
        case selection, impact, notification
        case keyPress
        case custom(SystemSoundID)
    }

    private static let soundEngine: SoundEngine = {
        let engine = SoundEngine()
        engine.prepare()
        return engine
    }()
    private static let tapticEngine: TapticEngine = {
        let engine = TapticEngine()
        engine.prepare()
        return engine
    }()

    public static func generate(sound: Sound? = nil, notification: Notification? = nil, impact: Impact? = nil) {
        if let sound = sound {
            soundEngine.generate(sound)
        }
        if let notification = notification {
            tapticEngine.generate(notification)
        }
        if let impact = impact {
            tapticEngine.generate(impact)
        }
    }
}
