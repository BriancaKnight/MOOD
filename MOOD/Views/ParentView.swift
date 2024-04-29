//
//  ParentView.swift
//  MOOD
//
//  Created by Brianca Knight on 4/19/24.
//

import SwiftUI

struct ParentView: View {
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
            
            ScrollView {
                VStack(spacing: 20) {
                    Text("Why MOOD?")
                        .font(.system(size: 38, weight: .bold))
                        .foregroundColor(.white)
                        .padding([.leading, .trailing], 10)
                        .padding(.vertical, 8)
                        .shadow(color: Color.black, radius: 3, x: 0, y: 0)
                        .background(Color.purple.cornerRadius(10))
                    
                    Text("This app was created to address the need for emotional regulation tools for children and provide opportunities for kids and their grown-ups to navigate big emotions in a way that is accessible and engaging for young users. By focusing on interactive activities and tools, the app empowers children to understand and manage their emotions while fostering open communication and collaboration between children and their caregivers.")
                        .font(.body)
                        .foregroundColor(.black)
                        .padding([.leading, .trailing], 10)
                        .padding(.bottom, 8)
                    
                    Text("Mooney's Moods")
                        .font(.system(size: 38, weight: .bold))
                        .foregroundColor(.white)
                        .padding([.leading, .trailing], 10)
                        .padding(.vertical, 8)
                        .shadow(color: Color.black, radius: 3, x: 0, y: 0)
                        .background(Color.purple.cornerRadius(10))
                    
                    Text("Mooney's Moods serves as a feelings glossary, using our mascot Mooney as an example to help children understand and navigate their emotions. By providing relatable scenarios and experiences, children can identify with Mooney and learn how to manage their own feelings.")
                        .font(.body)
                        .foregroundColor(.black)
                        .padding([.leading, .trailing], 10)
                        .padding(.bottom, 8)
                    
                    Text("BIG Feelings Quiz")
                        .font(.system(size: 38, weight: .bold))
                        .foregroundColor(.white)
                        .padding([.leading, .trailing], 10)
                        .padding(.vertical, 8)
                        .shadow(color: Color.black, radius: 3, x: 0, y: 0)
                        .background(Color.purple.cornerRadius(10))
                    
                    Text("The big feelings quiz helps kids understand and identify their emotions through interactive questions and choices. It also teaches them to listen to their bodies to recognize how they feel, encouraging open conversations with parents.")
                        .font(.body)
                        .foregroundColor(.black)
                        .padding([.leading, .trailing], 10)
                        .padding(.bottom, 8)
                    
                    Text("Audio Adventure")
                        .font(.system(size: 38, weight: .bold))
                        .foregroundColor(.white)
                        .padding([.leading, .trailing], 10)
                        .padding(.vertical, 8)
                        .shadow(color: Color.black, radius: 3, x: 0, y: 0)
                        .background(Color.purple.cornerRadius(10))
                    
                    Text("The audio game helps kids relax and stay grounded through interactive sounds. It promotes bonding and communication between parents and children, creating calming shared experiences.")
                        .font(.body)
                        .foregroundColor(.black)
                        .padding([.leading, .trailing], 10)
                        .padding(.bottom, 8)
                }
                .padding()
                .background(
                    Color.white.opacity(0.4)
                        .cornerRadius(10)
                        .shadow(radius: 4)
                )
                .padding()
            }
        }
    }
}

#Preview {
    ParentView()
}
