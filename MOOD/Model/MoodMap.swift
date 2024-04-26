//
//  MoodMap.swift
//  MOOD
//
//  Created by Brianca Knight on 4/25/24.
//

import Foundation
import UIKit

struct Mood {
    let title: String
    let pic: String
    let paragraph: String
    var image: UIImage?
    
    init(title: String, pic: String, paragraph: String) {
            self.title = title
            self.pic = pic
            self.paragraph = paragraph
            self.image = UIImage(named: pic) 
        }
}

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
