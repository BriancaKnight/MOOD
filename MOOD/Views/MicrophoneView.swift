////
////  MicrophoneView.swift
////  MOOD
////
////  Created by Brianca Knight on 4/24/24.
////
//
//import SwiftUI
//import AVFoundation
//
//class MicrophoneManager: NSObject, ObservableObject, AVAudioRecorderDelegate {
//    var audioRecorder: AVAudioRecorder!
//    @Published var isBlowing = false
//    private var lowPassResults: Double = 0.0
//    
//    override init() {
//        super.init()
//        let audioSession = AVAudioSession.sharedInstance()
//        do {
//            try audioSession.setCategory(.playAndRecord, mode: .default, options: .defaultToSpeaker)
//            try audioSession.setActive(true)
//            audioSession.requestRecordPermission { allowed in
//                if allowed {
////                    self.startRecording()
//                } else {
//                    print("Permission denied")
//                }
//            }
//        } catch {
//            print("Audio session error: \(error.localizedDescription)")
//        }
//    }
//    
//    func startRecording() {
//        let audioFilename = getDocumentsDirectory().appendingPathComponent("blow.caf")
//        
//        let settings: [String: Any] = [
//            AVFormatIDKey: Int(kAudioFormatAppleIMA4),
//            AVSampleRateKey: 44100.0,
//            AVNumberOfChannelsKey: 1,
//            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue
//        ]
//        
//        do {
//            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
//            audioRecorder.delegate = self
//            audioRecorder.isMeteringEnabled = true
//            audioRecorder.prepareToRecord()
//            audioRecorder.record()
//        } catch {
//            print("Record Error: \(error.localizedDescription)")
//        }
//    }
//    
//    func finishRecording(success: Bool) {
//        audioRecorder.stop()
//        audioRecorder = nil
//    }
//
//    func getDocumentsDirectory() -> URL {
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let documentsDirectory = paths[0]
//        return documentsDirectory
//    }
//    
//    func startCheckingBlowing() {
//        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
//            self.isBlowingOnMicrophone()
//        }
//        timer.fire()
//    }
//    
//    func isBlowingOnMicrophone() {
//        audioRecorder.updateMeters()
//        let averagePower = audioRecorder.averagePower(forChannel: 0)
//        let peakPower = audioRecorder.peakPower(forChannel: 0)
//        let ALPHA: Double = 0.05
//        
//        lowPassResults = ALPHA * Double(averagePower) + (1.0 - ALPHA) * lowPassResults
//        
//        if lowPassResults > -30 && !isBlowing {
//            isBlowing = true
//            print("Blowing detected")
//            // Blow action, you can put your blow out candle code here
//        } else if lowPassResults < -30 && isBlowing {
//            isBlowing = false
//        }
//    }
//    
//    // Adding the Microphone permission to the app's Info.plist
//    func addMicrophoneUsageDescription() {
//        guard let infoDictionary = Bundle.main.infoDictionary else {
//            fatalError("Info.plist not found!")
//        }
//        
//        if infoDictionary["NSMicrophoneUsageDescription"] == nil {
//            fatalError("Please add NSMicrophoneUsageDescription to Info.plist.")
//        }
//    }
//}
//
//struct MicrophoneView: View {
//    @ObservedObject var microphoneManager = MicrophoneManager()
//    
//    var body: some View {
//        Text("Blow here")
//            .onAppear {
//                self.microphoneManager.startCheckingBlowing()
//            }
//    }
//}
//
//struct MicrophoneView_Previews: PreviewProvider {
//    static var previews: some View {
//        MicrophoneView()
//    }
//}
