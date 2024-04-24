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
         choices: ["birds tweeting", "choo choo trains", "kids playing", "beads falling on the floor"]),
    
    Audio(promptText: "Open your ears!",
         choices: ["peaceful raindrops", "cooking in the kitchen", "baloons popping", "footsteps on gravel"]),
    
    Audio(promptText: "Hmmm...",
         choices: ["purring kittens", "coins jinggling", "rollercoaster rides", "dogs barking"]),
    
    Audio(promptText: "Use your ears!",
         choices: ["waves crashing", "crashing bowling pins", "cows mooing", "horns honking"]),
    
    Audio(promptText: "Listen closely...",
         choices: ["zippers zipping", "munching carrots", "eggs being cracked", "bees buzzing"]),
    
   
]
