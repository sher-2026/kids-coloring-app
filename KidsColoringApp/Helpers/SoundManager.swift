//
//  SoundManager.swift
//  KidsColoringApp
//
//  Manages sound effects and background music
//

import AVFoundation
import SwiftUI

class SoundManager: ObservableObject {
    @Published var isMusicEnabled = true
    private var audioPlayer: AVAudioPlayer?
    
    enum SoundEffect {
        case colorSelect
        case clear
        case save
        
        var systemSoundID: SystemSoundID {
            switch self {
            case .colorSelect:
                return 1104 // Pop sound
            case .clear:
                return 1051 // Swoosh sound
            case .save:
                return 1054 // Success sound
            }
        }
    }
    
    func playSound(_ effect: SoundEffect) {
        AudioServicesPlaySystemSound(effect.systemSoundID)
    }
    
    func toggleMusic() {
        isMusicEnabled.toggle()
        if isMusicEnabled {
            playBackgroundMusic()
        } else {
            stopBackgroundMusic()
        }
    }
    
    private func playBackgroundMusic() {
        // For now using system sounds, can be extended with custom audio files
        // Implementation can be added when custom music files are provided
    }
    
    private func stopBackgroundMusic() {
        audioPlayer?.stop()
    }
}
