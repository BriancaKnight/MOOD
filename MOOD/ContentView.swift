//
//  ContentView.swift
//  MOOD
//
//  Created by Brianca Knight on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
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
                    Spacer()
                    
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400)
                        .padding(.bottom, -40)
                
                    Spacer()
                        .frame(height: 0)

                    Image("clear")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400)
//                        .padding(.bottom, -50)
                        .padding(.bottom, 10)
                    
//                    Text("Let's learn about your")
//                        .fontWeight(.heavy)
//                        .foregroundColor(Color.white)
//                        .multilineTextAlignment(.center)
//                        .font(.system(size: 30, weight: .bold))
//                        .padding([.leading, .trailing], 10)
//                        .shadow(color: Color.black, radius: 2, x: 0, y: 0)
//
//                    Text("MOOD!")
//                        .fontWeight(.heavy)
//                        .foregroundColor(Color.white)
//                        .multilineTextAlignment(.center)
//                        .font(.system(size: 45, weight: .bold))
//                        .padding([.leading, .trailing], 10)
//                        .shadow(color: Color.black, radius: 2, x: 0, y: 0)

                    NavigationLink(destination: PageView(choiceMade: .constant(0))) {
                        Text("BIG Feelings Quiz")
                            .font(.system(size: 22, weight: .bold)) 
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                           
                    }
                    .buttonStyle(.borderedProminent)


                    NavigationLink(destination: AudioGameView()) {
                        Text("Audio Adventure Game")
                            .font(.system(size: 22, weight: .bold))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                    }
                    .buttonStyle(.borderedProminent)
   
                    
                    Spacer()
                    
                    NavigationLink(destination: ParentView()) {
                        Text("Grown-Ups Information")
                            .font(.subheadline)
                            .foregroundColor(.purple)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
