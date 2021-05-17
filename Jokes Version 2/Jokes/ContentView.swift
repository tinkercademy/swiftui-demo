//
//  ContentView.swift
//  Jokes
//
//  Created by JiaChen(: on 17/5/21.
//

import SwiftUI

struct ContentView: View {
    
    var jokes = [Joke(setup: "Why did the chicken cross the road?", punchline: "To get to the other side!"),
                 Joke(setup: "Why couldn't the bicycle stand up?", punchline: "It was two tired!"),
                 Joke(setup: "Is this pool safe for diving?", punchline: "It deep ends"),
                 Joke(setup: "Where do you learn to make ice cream?", punchline: "Sunday School"),
                 Joke(setup: "Did you hear about the cheese factory that exploded in France?", punchline: "There was nothing left but de Brie"),
                 Joke(setup: "Dad, can you put my shoes one?", punchline: "I dont think they'll fit me"),
                 Joke(setup: "Why do bees hum?", punchline: "Beacuse they dont know the words"),
                 Joke(setup: "How many apples grow on a tree?", punchline: "All of them"),
                 Joke(setup: "Can February March?", punchline: "No, but April May"),
                 Joke(setup: "What to prisoners use to call each other?", punchline: "Cell Phones"),
                 Joke(setup: "What do get when you cross a snowman with a vampire?", punchline: "Frosbite"),
                 Joke(setup: "What do you call a fake noodle?", punchline: "AN Impasta"),
                 Joke(setup: "I'm not addicated to brake fluid", punchline: "I can stop whenever I want"),
                 Joke(setup: "Don't trust atoms", punchline: "Thay make up everything"),
                 Joke(setup: "I'd like to give a big shout out to all the sidewalks", punchline: "for keeping me off the streets"),
                 Joke(setup: "What do you call cheese by itself", punchline: "Provolone"),
                 Joke(setup: "Last night I dreamt i mas a muffler", punchline: "I woke up eshausted"),
                 Joke(setup: "I am terrified of elevators", punchline: "I'l going to take steps to avoide them"),
                 Joke(setup: "I knew I shouldn't have had the seafood", punchline: "I'm feeling a little eel"),
                 Joke(setup: "Have you heard of the band 1023 MB?", punchline: "They havent got a gig yet"),
                 Joke(setup: "What did the buffalo say to his son when he left for collage?", punchline: "Bison"),
                 Joke(setup: "Whaere does Fonzie like to go for lunch?", punchline: "Chick-Fil-Eyyyyyyyyy"),
                 Joke(setup: "Why dont skeleton even go trick or treating?", punchline: "Because they have no body to go with"),
                 Joke(setup: "I bought shoes from a drug dealer once", punchline: "I don't know what he laced then with, but I was tripping all day")]
    
    @State var currentJoke = 0
    
    @State var showPunchline = false
    
    var body: some View {
        VStack {
            Text(jokes[currentJoke].setup)
                .padding()
            Button("What?") {
                showPunchline = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .padding()
            
            if showPunchline {
                Text(jokes[currentJoke].punchline)
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
                
                if currentJoke == jokes.count {
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
