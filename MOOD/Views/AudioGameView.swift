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
             choices: ["birds tweeting", "choo choo trains", "kids playing", "beads falling on the floor"]),
        
        Audio(promptText: "Open your ears!",
             choices: ["peaceful raindrops", "cooking in the kitchen", "baloons popping", "footsteps on gravel"]),
        
        Audio(promptText: "Hmmm...",
             choices: ["purring kittens", "coins jinggling", "rollercoaster rides", "dogs barking"]),
        
        Audio(promptText: "Use your ears!",
             choices: ["waves crashing", "crashing bowling pins", "cows mooing", "horns honking"]),
        
        Audio(promptText: "Listen closely...",
             choices: ["zippers zipping", "munching carrots", "eggs being cracked", "bees buzzing"]),
    ]
    
    @State private var currentPromptIndex = 0
    @State private var audioPlayer: AVAudioPlayer?
    @State private var showFeedback = false
    @State private var feedbackMessage = ""
    @State private var choiceIsCorrect = false
    @State private var isGameFinished = false
    
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
                
                Image("mooneyHappy")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .padding(.top, 70)
                
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
                
                .padding(.bottom, 120)
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
                            Image("mooneyRight")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 300)
                                .padding(.top, 40)
                        } else {
                            Image("mooneyWrong")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 300)
                                .padding(.top, 40)
                        }
                        
                        if currentPromptIndex != prompts.count - 1 {
                            Button("Next") {
                                showFeedback = false
                                moveToNextPrompt()
                            }
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            
            if isGameFinished {
                ZStack {
                    Color.white.opacity(0.9)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 20) {
                        Text("Whew, that was fun! Wanna play again?")
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                            .padding()
                            .font(.system(size: 30, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                        
                        Image("mooneyHappy")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                            .padding(.top, 70)
                        
                        Button("Play Again") {
                            restartGame()
                        }
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        NavigationLink(destination: ContentView()) {
                            Text("No thanks, take me home")
                                .padding()
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        isGameFinished = true
                    }
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
            feedbackMessage = "Yes! You got it! It was " + prompts[currentPromptIndex].choices[correctChoiceIndex] + "!"
        } else {
            choiceIsCorrect = false
            feedbackMessage = "Oops! Not this time! It was " + prompts[currentPromptIndex].choices[correctChoiceIndex] + "!"
        }
        showFeedback = true
        
        if currentPromptIndex == prompts.count - 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isGameFinished = true
            }
        }
    }
    
    func moveToNextPrompt() {
        audioPlayer?.stop()
        currentPromptIndex += 1
        if currentPromptIndex >= prompts.count {
            currentPromptIndex = 0
        }
    }
    
    func restartGame() {
        currentPromptIndex = 0
        isGameFinished = false
    }
}

struct AudioGameView_Previews: PreviewProvider {
    static var previews: some View {
        AudioGameView()
    }
}
