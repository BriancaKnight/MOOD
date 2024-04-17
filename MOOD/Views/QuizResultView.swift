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
        Text(result)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .font(.headline)
    }
}

// Preview for QuizResultView
struct QuizResultView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultView(result: "You might be feeling happy!")
    }
}
