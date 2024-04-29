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
                        .frame(width: 380)
                        .padding(.bottom, -30)
                
                    Spacer()
                        .frame(height: 0)
                    
                    Image("mooneyHappy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 380, height: 400)
                        .padding(.bottom, -25)
                    
                    NavigationLink(destination: MoodMapView()) {
                        Text("Mooney's Moods")
                            .font(.system(size: 22, weight: .bold))
                            .shadow(color: Color.black, radius: 1, x: 0, y: 0)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                    }
                    .buttonStyle(.borderedProminent)
                    
                    NavigationLink(destination: PageView(choiceMade: .constant(0))) {
                        Text("BIG Feelings Quiz")
                            .font(.system(size: 22, weight: .bold))
                            .shadow(color: Color.black, radius: 1, x: 0, y: 0)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                           
                    }
                    .buttonStyle(.borderedProminent)
                    
                    NavigationLink(destination: AudioGameView()) {
                        Text("Audio Adventure Game")
                            .font(.system(size: 22, weight: .bold))
                            .shadow(color: Color.black, radius: 1, x: 0, y: 0)
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
