//
//  ContentView.swift
//  MOOD
//
//  Created by Brianca Knight on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    init() {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            
            let gradientColors = [
                UIColor(red: 0.99, green: 0.40, blue: 0.61, alpha: 1.0),
                UIColor(red: 0.70, green: 0.47, blue: 1.0, alpha: 1.0),
            ]
            
            let gradientBackground = Gradient(colors: gradientColors.map { Color($0) })
            let backgroundImage = UIImage.imageFromGradient(colors: gradientColors, size: CGSize(width: UIScreen.main.bounds.width, height: 100))
            
            appearance.backgroundImage = backgroundImage
            UINavigationBar.appearance().standardAppearance = appearance
        }
    
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

extension UIImage {
    static func imageFromGradient(colors: [UIColor], size: CGSize) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = CGRect(origin: .zero, size: size)

        UIGraphicsBeginImageContextWithOptions(gradientLayer.bounds.size, true, 0.0)
        defer { UIGraphicsEndImageContext() }

        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
