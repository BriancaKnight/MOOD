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
         choices: ["A bird tweeting", "A choo choo train", "Kids having fun", "Beads falling on the floor"]),
    
    Audio(promptText: "Listen closely...",
         choices: ["Peaceful raindrops", "Someone cooking in the kitchen", "Baloons popping", "The sounds of footsteps on gravel"]),
    
    Audio(promptText: "Hmmm...",
         choices: ["A purring kitten", "Coins jinggling", "A rollercoaster", "A dog barking"]),
    
    Audio(promptText: "Use your ears!",
         choices: ["The ocean waves crashing", "A game of bowling", "A cow mooing", "A horn honking"]),
    
    Audio(promptText: "Open your ears!",
         choices: ["A zipper zipping!", "Someone eating a carrot", "An egg being cracked", "Someoone skateboarding"]),
    
   
]
