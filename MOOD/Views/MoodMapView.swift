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
        
        Mood(title: "Surprised",
             pic: "mooneyRight",
             paragraph: "Mooney is so surprised! Her eyes get really big, like saucers, and her mouth opens wide like a big 'O'. It feels like her whole body is buzzing with excitement, like she just won a special prize. When Mooney feels surprised, she loves to share the fun surprise with her friends and family."
        ),
        
        Mood(title: "Disappointed",
             pic: "mooneyWrong",
             paragraph: "Mooney feels a bit disappointed. It's like her shoulders droop down like a sad puppy, and her tummy feels all twisty, like a rollercoaster going the wrong way. When Mooney feels disappointed, she knows it's okay to feel that way, and she tries to think of something fun to cheer herself up."
        ),
    ]
    
    var body: some View {
            ZStack {
                // First, let's add the gradient background
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
                
                // Next, let's add the slithery path behind the mood icons
                Path { path in
                    // Define the start and end points of the slithery line
                    let startPoint = CGPoint(x: 0, y: 0)
                    let endPoint = CGPoint(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height)
                    
                    // Define the control point to create a slithery shape with one curve
                    let controlPoint = CGPoint(x: UIScreen.main.bounds.width * 0.6, y: UIScreen.main.bounds.height * 0.8)
                    
                    // Move to the start point of the path
                    path.move(to: startPoint)
                    
                    // Add curve to create the slithery shape
                    path.addQuadCurve(to: endPoint, control: controlPoint)
                }
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round)) // Increased line width
                .foregroundColor(Color.white.opacity(0.7))
                .offset(y: 20) // Adjust the offset to position the line behind the mood icons
                
                VStack(spacing: 20) {
                    Text("Mooney's Mood Map")
                        .font(.system(size:36, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    ForEach(map, id: \.title) { mood in
                        VStack {
                            Image(mood.pic)
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text(mood.title)
                                .foregroundColor(.white)
                                .font(.title)
                        }
                    }
                }
                .padding()
            }
        }
    }

    struct MoodMapView_Previews: PreviewProvider {
        static var previews: some View {
            MoodMapView()
        }
    }
