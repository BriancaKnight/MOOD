//
//  MoodDetailsView.swift
//  MOOD
//
//  Created by Brianca Knight on 4/29/24.
//

import SwiftUI

struct MoodDetailsView: View {
    let mood: Mood
    
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
            
            VStack(spacing: 5) {
                Image(mood.pic)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 350)
                    .padding(.bottom, -5) 
                
                Text("Mooney is " + mood.title + "!")
                    .font(.system(size: 38, weight: .bold))
                    .foregroundColor(.white)
                    .padding([.leading, .trailing], 10)
                    .padding(.vertical, 3)
                    .shadow(color: Color.black, radius: 3, x: 0, y: 0)
                    .background(Color.purple.cornerRadius(10))
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                Text(mood.paragraph)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
            }
            .padding()
            .background(
                Color.white.opacity(0.4)
                    .cornerRadius(10)
                    .shadow(radius: 4)
            )
            .padding(.horizontal, 30)
        }
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct MoodDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MoodDetailsView(mood: Mood(title: "Dissapointed", pic: "mooneyHappy", paragraph: "Mooney feels a bit disappointed. It's like her shoulders droop down like a sad puppy, and her tummy feels all twisty, like a rollercoaster going the wrong way. When Mooney feels  that way she tries to think of something fun to cheer herself up."))
    }
}
