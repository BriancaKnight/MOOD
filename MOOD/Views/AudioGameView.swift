//
//  AudioGameView.swift
//  MOOD
//
//  Created by Brianca Knight on 4/18/24.
//

import SwiftUI
import AVFoundation

struct AudioGameView: View {
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(stops: [
                    Gradient.Stop(color: Color(red: 0.99, green: 0.40, blue: 0.61), location: 0.0),
                    Gradient.Stop(color: Color(red: 0.70, green: 0.47, blue: 1.0), location: 0.33),
                    Gradient.Stop(color: Color(red: 0.40, green: 0.94, blue: 0.99), location: 0.66),
                    Gradient.Stop(color: Color(red: 0.60, green: 0.94, blue: 0.36), location: 1.0)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            

            Button("Play Sound") {
                playSound()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
    
    func playSound() {

        if let soundURL = Bundle.main.url(forResource: "bird", withExtension: "wav") {
            do {
       
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
           
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found.")
        }
    }
}

#Preview {
    AudioGameView()
}
