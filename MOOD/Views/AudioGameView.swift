//
//  AudioGameView.swift
//  MOOD
//
//  Created by Brianca Knight on 4/18/24.
//

import SwiftUI
import AVFoundation

struct AudioGameView: View {
    let prompts: [Audio] = [
        Audio(promptText: "What do you hear?",
             choices: ["A bird tweeting", "A choo choo train", "Kids having fun", "Beads falling on the floor"]),
        Audio(promptText: "Listen closely...",
             choices: ["Peaceful raindrops", "Someone cooking in the kitchen", "Balloons popping", "The sounds of footsteps on gravel"]),
        Audio(promptText: "Hmmm...",
             choices: ["A purring kitten", "Coins jingling", "A rollercoaster", "A dog barking"]),
        Audio(promptText: "Use your ears!",
             choices: ["The ocean waves crashing", "A game of bowling", "A cow mooing", "A horn honking"]),
        Audio(promptText: "Open your ears!",
             choices: ["A zipper zipping!", "Someone eating a carrot", "An egg being cracked", "Someone skateboarding"]),
    ]

    @State private var currentPromptIndex = 0
    @State private var audioPlayer: AVAudioPlayer?
    @State private var showFeedback = false
    @State private var feedbackMessage = ""
    @State private var choiceIsCorrect = false

    var body: some View {
        ZStack {
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
            
            VStack {
                
                Image("clear")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .padding(.top, 40)
                
                Button("Play Sound") {
                    playSound()
                }
                .padding()
                .font(.system(size: 30, weight: .regular))
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 2)
                )
                
                Text(prompts[currentPromptIndex].promptText)
                    .font(.system(size: 42, weight: .bold))
                    .foregroundColor(Color.white)
                    .padding([.leading, .trailing], 10)
                    .padding(.bottom, 20)
                    .shadow(color: Color.black, radius: 2, x: 0, y: 0)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .frame(maxWidth: .infinity)
                
                Spacer()
                
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 20) {
                    ForEach(0..<prompts[currentPromptIndex].choices.count, id: \.self) { index in
                        Button(action: {
                            handleChoiceSelection(choiceIndex: index)
                        }) {
                            Text(prompts[currentPromptIndex].choices[index])
                                .padding()
                                .frame(width: 160, height: 160)
                                .font(.system(size: 20, weight: .bold))
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 3)
                        }
                    }
                }
                
                .padding(.bottom, 70)
                .padding([.leading, .trailing])
            }
            .padding([.top, .bottom], 20)
            
            if showFeedback {
                ZStack {
                    Color.white.opacity(0.9)
                        .ignoresSafeArea()
                    
                    VStack {
                        Text(feedbackMessage)
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                            .padding()
                            .font(.system(size: 30, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                        
                        if choiceIsCorrect {
                            Image("happy")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 300)
                                .padding(.top, 40)
                        } else {
                            Image("sad")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 300)
                                .padding(.top, 40)
                        }
                        
                        Button("Next") {
                            showFeedback = false
                            moveToNextPrompt()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }

    func playSound() {
        let soundFileName: String
        
        switch currentPromptIndex {
        case 0:
            soundFileName = "bird"
        case 1:
            soundFileName = "rain"
        case 2:
            soundFileName = "pur"
        case 3:
            soundFileName = "ocean"
        case 4:
            soundFileName = "zipper"
        default:
            return
        }

        if let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "wav") {
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

    func handleChoiceSelection(choiceIndex: Int) {
        let correctChoiceIndex = 0
        if choiceIndex == correctChoiceIndex {
            choiceIsCorrect = true
            feedbackMessage = "Yes! You got it! It was a " + prompts[currentPromptIndex].choices[correctChoiceIndex] + "."
        } else {
            choiceIsCorrect = false
            feedbackMessage = "Opps! Not this time! It was a " + prompts[currentPromptIndex].choices[correctChoiceIndex] + "."
        }
        showFeedback = true
    }

    func moveToNextPrompt() {
        audioPlayer?.stop()
        currentPromptIndex += 1
        if currentPromptIndex >= prompts.count {
            currentPromptIndex = 0
        }
    }
}

#Preview {
    AudioGameView()
}
