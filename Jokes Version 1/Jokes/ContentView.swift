//
//  ContentView.swift
//  Jokes
//
//  Created by JiaChen(: on 17/5/21.
//

import SwiftUI

struct ContentView: View {
    
    var setups = ["Why did the chicken cross the road?", "Why couldn't the bicycle stand up?", "Is this pool safe for diving?", "Where do you learn to make ice cream?", "Did you hear about the cheese factory that exploded in France?", "Dad, can you put my shoes one?", "Why do bees hum?", "How many apples grow on a tree?", "Can February March?", "What to prisoners use to call each other?", "What do get when you cross a snowman with a vampire?", "What do you call a fake noodle?", "I'm not addicated to brake fluid", "Don't trust atoms", "I'd like to give a big shout out to all the sidewalks", "What do you call cheese by itself", "Last night I dreamt i mas a muffler", "I am terrified of elevators", "I knew I shouldn't have had the seafood", "Have you heard of the band 1023 MB?", "What did the buffalo say to his son when he left for collage?", "Whaere does Fonzie like to go for lunch?", "Why dont skeleton even go trick or treating?", "I bought shoes from a drug dealer once"]
    var punchlines = ["To get to the other side!", "It was two tired!", "It deep ends", " Sunday School", "There was nothing left but de Brie", "I dont think they'll fit me", "Beacuse they dont know the words", "All of them", "No, but April May", "Cell Phones", "Frosbite", "AN Impasta", "I can stop whenever I want", "Thay make up everything", "for keeping me off the streets", "Provolone", "I woke up eshausted", "I'l going to take steps to avoide them", "I'm feeling a little eel", "They havent got a gig yet", "Bison", "Chick-Fil-Eyyyyyyyyy", "Because they have no body to go with", "I don't know what he laced then with, but I was tripping all day"]
    
    @State var currentJoke = 0
    
    @State var showPunchline = false
    
    var body: some View {
        VStack {
            Text(setups[currentJoke])
                .padding()
            Button("What?") {
                showPunchline = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .padding()
            
            if showPunchline {
                Text(punchlines[currentJoke])
                    .padding()
                Text("Tap to continue")
                    .italic()
                    .padding()
            }
        }.onTapGesture {
            // No cheating, must show punchline before u see next one
            if showPunchline {
                print("The current joke is \(currentJoke)")
                currentJoke += 1
                print("We have increased it to \(currentJoke)")
                
                if currentJoke == punchlines.count {
                    print("Reset!")
                    currentJoke = 0
                }
                
                showPunchline = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
