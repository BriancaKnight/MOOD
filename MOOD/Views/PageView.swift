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
    
    var body: some View {
//        if quizEnded {
//            QuizResultView(result: determineEmotion())
//                .navigationTitle("Quiz Result")
//        } else {
            let shuffledQuestions = questions.shuffled()
            let currentPage: Quiz = shuffledQuestions[choiceMade]
            
            VStack {
                Text(currentPage.questionText)
                    .padding()
                    .background(Color.pink)
                
                ForEach(Array(currentPage.choices.enumerated()), id: \.offset) { index, choice in
                    Button(action: {
                        processQuiz(response: index + 1)
                        choiceMade = shuffledQuestions.indices.contains(choiceMade + 1) ? choiceMade + 1 : 0
                        questionsAsked += 1
                        
                        // Check if any emotion has reached 3 points
                        if tally[1] == 3 || tally[2] == 3 || tally[3] == 3 {
                            quizEnded = true // End the quiz
                        }
                    }) {
                        Text(choice)
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .font(.headline)
                }
                
                Spacer()
                
                if questionsAsked >= 5 {
                    quizEnded = true // End the quiz if 5 questions are asked
                }
            }
            .navigationTitle("Quiz")
        }
    }
//}


struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(choiceMade: .constant(0))
    }
}

