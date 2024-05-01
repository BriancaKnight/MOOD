//
//  MoodMapView.swift
//  MOOD
//
//  Created by Brianca Knight on 4/26/24.
//

import SwiftUI

struct MoodMapView: View {
    
    let map = [
        Mood(title: "Happy",
             pic: "mooneyHappy",
             paragraph: "Mooney feels super happy! Her cheeks are all smiles, and her eyes shine with joy. It feels like a warm hug inside her chest, and her heart beats like a happy drum. When Mooney is happy, she loves playing with friends, giggling, and singing her favorite songs."
        ),
        Mood(title: "Sad",
             pic: "mooneySad",
             paragraph: "Mooney feels a little sad today. Tears are like raindrops in her eyes, and her shoulders feel heavy like carrying a big bag. Her heart feels like it's in a little cloud. When Mooney feels sad, she likes to have quiet time with her favorite stuffed animals or cuddle with a cozy blanket."
        ),
        Mood(title: "Mad",
             pic: "mooneyMad",
             paragraph: "Mooney is feeling really mad! Her face turns red like a tomato, and her hands feel all clenched up. It's like there's a storm inside her, ready to burst out. When Mooney feels mad, she knows it's okay to feel that way, but she tries taking deep breaths and counting to cool down."
        ),
        Mood(title: "Worried",
             pic: "mooneyWorried",
             paragraph: "Mooney is feeling a bit worried. It's like there's a fluttering butterfly in her tummy, and her throat feels a bit tight, like there's a little frog sitting there. When Mooney feels worried, she talks to someone she trusts, like a grown-up or a friend, to help her feel better."
        ),
        Mood(title: "Excited",
             pic: "mooneyRight",
             paragraph: "Mooney is feeling super excited! She's jumping up and down with joy, and her eyes sparkle with happiness. It's like she's ready for the best day ever! When Mooney feels excited, she loves to share her excitement by giggling and laughing with her friends and family."
        ),
        Mood(title: "Disappointed",
             pic: "mooneyWrong",
             paragraph: "Mooney feels a bit disappointed. It's like her shoulders droop down like a sad puppy, and her tummy feels all twisty, like a rollercoaster going the wrong way. When Mooney feels  that way she tries to think of something fun to cheer herself up."
        ),
    ]
    
    var body: some View {
        NavigationView {
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
                
                VStack(spacing: 20) {
                    Text("Mooney's Moods")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding(.top, 30)
                        .padding(.bottom, -10)
                        .shadow(color: Color.black, radius: 2, x: 0, y: 0)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                    
                    Text("Click a BIG feeling to learn more!")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .shadow(color: Color.black, radius: 1, x: 0, y: 0)
                        .multilineTextAlignment(.center)
                    
                    ForEach(map, id: \.title) { mood in
                        NavigationLink(destination: MoodDetailsView(mood: mood)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.purple.opacity(0.5))
                                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 2)
                                
                                HStack {
                                    Image(mood.pic)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 90, height: 90)
                                    
                                    Spacer()
                                    
                                    Text(mood.title)
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundColor(.white)
                                        .shadow(color: Color.black, radius: 1, x: 0, y: 0)
                                        .multilineTextAlignment(.center)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal, 20)
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true) 
        }
    }
}

struct MoodMapView_Previews: PreviewProvider {
    static var previews: some View {
        MoodMapView()
    }
}
