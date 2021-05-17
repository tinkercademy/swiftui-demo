//
//  Question.swift
//  Quiz App Version 2A
//
//  Created by YJ Soon on 30/5/20.
//  Copyright © 2020 YJ Soon. All rights reserved.
//

import Foundation

enum OptionChoice {
    case one
    case two
    case three
    case four
}

struct Question {
    var question: String
    var choice1: String
    var choice2: String
    var choice3: String
    var choice4: String
    
    var correctChoice: OptionChoice
}
