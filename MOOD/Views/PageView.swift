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
    @State private var askedQuestions: Set<Int> = []
    
    var currentQuestion: Quiz? {
        nextQuestion()
    }
    
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
                if let currentPage = currentQuestion {
                    VStack {
                        Image("clear")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300)
                        
                        Text(currentPage.questionText)
                            .padding()
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .cornerRadius(10)
                        
                        ForEach(Array(currentPage.choices.enumerated()), id: \.offset) { index, choice in
                            Button(action: {
                                processQuiz(response: index + 1)
                                questionsAsked += 1
                                choiceMade += 1
                                
                                checkQuizEnd()
                            }) {
                                Text(choice)
                                    .padding()
                                    .background(Color.purple)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .font(.headline)
                            }
                        }
                        
                        Spacer()
                    }
                    .navigationTitle("Quiz")
                }
            }
        }
    }

    // Find the next question that hasn't been asked yet
    func nextQuestion() -> Quiz? {
        var availableQuestions = questions.enumerated().filter { !askedQuestions.contains($0.offset) }
        
        // If there are no available questions, end the quiz
        guard let (index, question) = availableQuestions.randomElement() else {
            quizEnded = true
            return nil
        }
        
        // Mark the question as asked
        askedQuestions.insert(index)
        
        return question
    }

    // `processQuiz` function should be within `PageView` struct
    func processQuiz(response: Int) {
        if let currentValue = tally[response] {
            tally[response] = currentValue + 1
        } else {
            // Handle the case where response is not a valid key in the tally dictionary
            print("Invalid response choice: \(response)")
        }
    }

    func checkQuizEnd() {
        if questionsAsked >= 5 && tally.values.contains(where: { $0 >= 3 }) {
            quizEnded = true
        }
    }

    struct PageView_Previews: PreviewProvider {
        static var previews: some View {
            PageView(choiceMade: .constant(0))
        }
    }
}
