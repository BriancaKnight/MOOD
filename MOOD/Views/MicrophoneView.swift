//
//  MicrophoneView.swift
//  MOOD
//
//  Created by Brianca Knight on 4/24/24.
//

import SwiftUI
import AVFoundation

class MicrophoneManager: NSObject, ObservableObject, AVAudioRecorderDelegate {
    var audioRecorder: AVAudioRecorder!
    @Published var isBlowing = false
    private var lowPassResults: Double = 0.0
    
    override init() {
        super.init()
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default, options: .defaultToSpeaker)
            try audioSession.setActive(true)
            audioSession.requestRecordPermission { allowed in
                if allowed {
//                    self.startRecording()
                } else {
                    print("Permission denied")
                }
            }
        } catch {
            print("Audio session error: \(error.localizedDescription)")
        }
    }
    
}
