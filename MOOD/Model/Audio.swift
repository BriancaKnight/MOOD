//
//  Audio.swift
//  MOOD
//
//  Created by Brianca Knight on 4/18/24.
//

import Foundation

struct Audio {
    let promptText: String
    let choices: [String]
}

let prompt = [
    Audio(promptText: "What do you hear?",
         choices: ["A bird tweeting", "A choo choo train", "Kids having fun"]),
    
    Audio(promptText: "Which sound is this?",
         choices: ["Peaceful raindrops", "Someone cooking in the kitchen", "Baloons popping"]),
    
    Audio(promptText: "Listen closely...",
         choices: ["A purring kitten", "Coins jinggling", "A rollercoaster"]),
    
    Audio(promptText: "Use your ears!",
         choices: ["The ocean waves crashing", "A game of bowling", "A cow mooing"]),
    
    Audio(promptText: "Deep breath, and listen...",
         choices: ["A zipper zipping!", "Someone eating a carrot", "An egg being cracked"]),
    
   
]
