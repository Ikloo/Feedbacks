//
//  SoundEngine.swift
//  Feedbacks
//
//  Created by Kirill Budevich on 7/7/19.
//

import AVFoundation

final class SoundEngine: HapticsEngine {
    func prepare() {
        // Empty
    }

    func generate(_ sound: Haptics.Sound) {
        AudioServicesPlaySystemSoundWithCompletion(sound.id, nil)
    }

    func generate(_ impact: Haptics.Impact) {
        print("Sound impact not supported")
    }
}

private extension Haptics.Sound {
    var id: SystemSoundID {
        switch self {
        case .success: return SystemSoundID(1519)
        case .warning: return SystemSoundID(1102)
        case .error: return SystemSoundID(1107)
        case .selection: return SystemSoundID(1519)
        case .impact: return SystemSoundID(1520)
        case .notification: return SystemSoundID(1521)
        case .keyPress: return SystemSoundID(1104)
        case .custom(let id): return id
        }
    }
}
