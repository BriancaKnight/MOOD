//
//  QuizResultView.swift
//  MOOD
//
//  Created by Brianca Knight on 4/17/24.
//

import SwiftUI

struct QuizResultView: View {
    var result: String
    
    var body: some View {
        ZStack {
            // Gradient background
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
            
            VStack(spacing: 20) {
                // Display different images based on the result
                if result == "You might be feeling sad." {
                    Image("sad")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                } else if result == "You might be feeling angry." {
                    Image("angry")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                } else if result == "You might be feeling worried." {
                    Image("anxious")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                }
                
                // Result text
                Text(result)
                    .padding()
                    .foregroundColor(.black)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center) // Center-align the text
                    .background(Color.white.opacity(0.8)) // Background color with some opacity
                    .cornerRadius(10)
                
                // Advice text
                Text(getEmotionAdvice(result: result))
                    .padding()
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .medium))
                    .multilineTextAlignment(.center) // Center-align the text
                    .background(Color.white.opacity(0.8)) // Background color with some opacity
                    .cornerRadius(10)
            }
            .padding()
        }
    }
    

    func getEmotionAdvice(result: String) -> String {
        switch result {
            case "You might be feeling sad.":
                return "It's okay to feel sad. Try talking to someone you trust or listen to music that makes you feel calm."
            case "You might be feeling angry.":
                return "Anger can be tough to handle. Try taking deep breaths or going for a walk to calm down."
            case "You might be feeling worried.":
                return "Worry can be hard to control. Try writing down your thoughts or talking to someone about them."
            default:
                return ""
        }
    }
}


struct QuizResultView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultView(result: "You might be feeling angry!")
    }
}
