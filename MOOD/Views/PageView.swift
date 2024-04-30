//
//  PageView.swift
//  MOOD
//
//  Created by Brianca Knight on 4/17/24.
//

import SwiftUI

struct PageView: View {
    @Binding var choiceMade: Int
    @State private var tally: [Int: Int] = [1: 0, 2: 0, 3: 0]
    @State private var questionsAsked = 0
    @State private var quizEnded = false
    @State private var shuffledQuestions = questions.shuffled()
    
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
            
            if quizEnded {
                QuizResultView(result: determineEmotion())
                    .navigationTitle("Quiz Result")
            } else {
                let currentPage: Quiz = shuffledQuestions[questionsAsked]
                
                VStack {
                    
                    Image("mooneyHappy")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .padding(.top, 50)
                        .padding(.bottom, -30) 
                    
                    Text(currentPage.questionText)
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                 
                    
                    ForEach(Array(currentPage.choices.enumerated()), id: \.offset) { index, choice in
                        Button(action: {
                            processQuiz(response: index + 1)
                            tally[questionsAsked] = index + 1
                            questionsAsked += 1
                            checkQuizEnd()
                        }) {
                            Text(choice)
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.purple)
                                .cornerRadius(10)
                                .font(.headline)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                    }
                    
                    Spacer()
                }
            }
        }
    }
    
    func checkQuizEnd() {
        if questionsAsked >= 5 {
            let madTally = tally.values.filter { $0 == 1 }.count
            let sadTally = tally.values.filter { $0 == 2 }.count
            let anxiousTally = tally.values.filter { $0 == 3 }.count
            
            if madTally >= 3 || sadTally >= 3 || anxiousTally >= 3 {
                quizEnded = true
            }
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(choiceMade: .constant(0))
    }
}
