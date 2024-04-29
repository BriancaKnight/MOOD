import SwiftUI

struct QuizResultView: View {
    var result: String
    
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
            
            VStack(spacing: 20) {
               
                if result == "Feeling sad?" {
                    Image("mooneySad")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400)
                } else if result == "Feeling angry?" {
                    Image("mooneyMad")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400)
                } else if result == "Feeling worried?" {
                    Image("mooneyWorried")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400)
                }
                
           
                Text(result)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                
         
                Text(getEmotionAdvice(result: result))
                    .padding()
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .medium))
                    .multilineTextAlignment(.center)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                
                HStack {
                    
                    NavigationLink(destination: PageView(choiceMade: .constant(0))) {
                        Text("Retake Quiz")
                            .font(.system(size: 22, weight: .bold))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color.white)
                            .foregroundColor(.purple)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
    }
    
    func getEmotionAdvice(result: String) -> String {
        switch result {
            case "Feeling sad?":
                return "It's okay to feel sad. Try talking to someone you trust or listen to music that makes you feel calm."
            case "Feeling angry?":
                return "Anger can be tough to handle. Try taking deep breaths or going for a walk to calm down."
            case "Feeling worried?":
                return "Worry can be hard to control. Try writing down your thoughts or talking to someone about them."
            default:
                return ""
        }
    }
}

struct QuizResultView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultView(result: "Feeling worried?")
    }
}
