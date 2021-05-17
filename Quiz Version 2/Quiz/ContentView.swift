//
//  ContentView.swift
//  Quiz
//
//  Created by JiaChen(: on 17/5/21.
//

import SwiftUI

struct ContentView: View {
    
    var questions = [Question(question: "What language do you use to code iOS apps?", choice1: "Perl", choice2: "Swift", choice3: "Chinese", choice4: "Python", correctChoice: .two),
                     Question(question: "What phones can you program for in Xcode?", choice1: "Nokia", choice2: "iPhone", choice3: "Galaxy", choice4: "eyePhone", correctChoice: .two),
                    Question(question: "Which company created the Mac?", choice1: "Apple", choice2: "McDonalds", choice3: "Orange", choice4: "KFC", correctChoice: .one)
    ]
    
    @State var isCorrect = false
    @State var isSheetPresented = false
    
    @State var currentQuestion = 0
    
    var body: some View {
        VStack(spacing: 16) {
            
            if currentQuestion < questions.count {
                Text(questions[currentQuestion].question)
                    .font(.title)
                    .padding()
                
                VStack {
                    HStack {
                        Button(action: {
                            isCorrect = questions[currentQuestion].correctChoice == .one
                            nextQuestion()
                        }) {
                            Image(systemName: "triangle.fill")
                            Text(questions[currentQuestion].choice1)
                                .font(.system(size: 15))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        
                        Button(action: {
                            isCorrect = questions[currentQuestion].correctChoice == .two
                            nextQuestion()
                        }) {
                            Image(systemName: "diamond.fill")
                            Text(questions[currentQuestion].choice2)
                                .font(.system(size: 15))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                    }
                    
                    HStack {
                        Button(action: {
                            isCorrect = questions[currentQuestion].correctChoice == .three
                            nextQuestion()
                        }) {
                            Image(systemName: "circle.fill")
                            Text(questions[currentQuestion].choice3)
                                .font(.system(size: 15))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.yellow)
                        .foregroundColor(.white)
                        
                        Button(action: {
                            isCorrect = questions[currentQuestion].correctChoice == .four
                            nextQuestion()
                        }) {
                            Image(systemName: "square.fill")
                            Text(questions[currentQuestion].choice4)
                                .font(.system(size: 15))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                    }
                }
            } else {
                Text("No more questions")
                    .bold()
            }
        }
        .padding()
        .sheet(isPresented: $isSheetPresented) {
            if isCorrect {
                CorrectView()
            } else {
                WrongView()
            }
        }
    }
    
    func nextQuestion() {
        currentQuestion += 1
        
        isSheetPresented = true
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
