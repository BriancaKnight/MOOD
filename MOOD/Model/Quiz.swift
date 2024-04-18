//
//  Quiz.swift
//  MOOD
//
//  Created by Brianca Knight on 4/17/24.
//


import Foundation

struct Quiz {
    let questionText: String
    let choices: [String]
}

let questions = [
    Quiz(questionText: "Where in your body do you feel your big feelings?",
         choices: ["In my face, hot and big!", "Heavy in my chest.", "Twisted in my tummy."]),
    
    Quiz(questionText: "What do your words want to do?",
         choices: ["They want to yell and scream!", "They want to hide and be quiet.", "They are confused and are not sure what to do."]),
    
    Quiz(questionText: "What do you want to do right now?",
         choices: ["I want to throw and break things!", "I want to lay down and be alone.", "I want my grown up to cuddle me and keep me safe."]),
    
    Quiz(questionText: "If your big feeling controlled the weather, what type of weather would it be?",
         choices: ["A thunderstorm, all loud and fierce", "A rainy day with clouds and no sunshine", "You couldn't predict my weather - it would be all over the place."]),
    
    Quiz(questionText: "What color would your big feeling be?",
         choices: ["Red like fire!", "Blue like rain", "Green like something rotten."]),
    
    Quiz(questionText: "If your big feeling could make a sound, what would it sound like?",
         choices: ["They'd sound like a fierce roar!", "They'd sound like quiet sniffles and sobs", "They'd sound like nervous worries and whispers."]),
    
    Quiz(questionText: "If your BIG feeling was an animal, which animal would it be?",
         choices: ["An angry lion ready to roar.", "A sad puppy whimpering for comfort", "A nervous rabbit, always ready to jump away."]),
    
    Quiz(questionText: "What does your heart want to do during this BIG feeling?",
         choices: ["Thump and pump faster and faster!", "It wants to beat slowly and rest.", "Flutter like hummingbird wings, never slowing down."])
]

var tally: [Int: Int] = [1: 0, 2: 0, 3: 0]

func processQuiz(response: Int) {
    if let count = tally[response] {
        tally[response] = count + 1
    }
}

func determineEmotion() -> String {
    guard let maxTally = tally.values.max() else {
        return "No response recorded."
    }
    
    if let emotion = tally.first(where: { $0.value == maxTally }) {
        switch emotion.key {
            case 1:
                return "You might be feeling angry."
            case 2:
                return "You might be feeling sad."
            case 3:
                return "You might be feeling worried."
            default:
                return "Invalid Response."
        }
    } else {
        return "No predominant emotion detected."
    }
}
