//
//  ContentView.swift
//  rockpaperscissors
//
//  Created by Aitzaz Munir on 01/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerMoves = ["rock", "paper","scissors"]
    @State var compMoves = ["rock", "paper", "scissors"].shuffled()
    @State var playerWins = Bool.random()
    @State var randomNumber = Int.random(in: 0...2)
    @State var playerScore = 0
    @State var scoreTitle = ""
    @State var showingScore = false
    @State var questionsDone = 0
    @State var showFinalScore = false
    
    
    
    var body: some View {
        
        VStack {
            VStack {
                
                Text(compMoves[randomNumber])
                    .foregroundStyle(.black)
                    .font(.title.bold())
                if playerWins {
                    Text("Player should win")
                        .foregroundStyle(.black)
                        .font(.title.bold())
                    
                    
                }
                else {
                    Text("Player should lose")
                        .foregroundStyle(.black)
                        .font(.title.bold())
                    
                }
                
                Button {answerTapped("rock")} label:{
                    Text("rock")
                }
                Button {answerTapped("paper")} label :{
                    Text("paper")
                }
                Button {answerTapped("scissors")} label :{
                    Text("scissors")
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 20))
            Spacer()
            Spacer()
            Text("Score: \(playerScore)")
                .foregroundStyle(.black)
                .font(.title.bold())
            Spacer()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: newQuestion)
        } message: {
            Text("Your score is \(playerScore)")
        }
        
        .alert("Your Final Score is \(playerScore)", isPresented: $showFinalScore){
            Button("Restart", action: newGame)
        }
    
        
    }
        
    
    
    
    
    
    
    func answerTapped(_ answer : String) {
        if playerWins == true {
            if compMoves[randomNumber] == "rock" {
                if answer == "paper" {
                    playerScore = playerScore + 1
                    scoreTitle = "Correct, computer chose \(compMoves[randomNumber]) and to win you chose \(answer)"
                }
                else {
                    playerScore = (playerScore > 0) ? (playerScore - 1) : playerScore
                    scoreTitle = "Incorrect, computer chose \(compMoves[randomNumber]) and to win you chose \(answer)"
                }
            }
            if compMoves[randomNumber] == "paper" {
                if answer == "scissors" {
                    playerScore = playerScore + 1
                    scoreTitle = "Correct, computer chose \(compMoves[randomNumber]) and to win you chose \(answer)"
                }
                else {
                    playerScore = (playerScore > 0) ? (playerScore - 1) : playerScore
                    scoreTitle = "Incorrect, computer chose \(compMoves[randomNumber]) and to win you chose \(answer)"
                }
            }
            if compMoves[randomNumber] == "scissors" {
                if answer == "rock" {
                    playerScore = playerScore + 1
                    scoreTitle = "Correct, computer chose \(compMoves[randomNumber]) and to win you chose \(answer)"
                }
                else {
                    playerScore = (playerScore > 0) ? (playerScore - 1) : playerScore
                    scoreTitle = "Incorrect, computer chose \(compMoves[randomNumber]) and to win you chose \(answer)"
                }
            }
            
            
        }
        if playerWins == false {
            if compMoves[randomNumber] == "rock" {
                if answer == "scissors" {
                    playerScore = playerScore + 1
                    scoreTitle = "Correct, computer chose \(compMoves[randomNumber]) and to lose you chose \(answer)"
                }
                else {
                    playerScore = (playerScore > 0) ? (playerScore - 1) : playerScore
                    scoreTitle = "Incorrect, computer chose \(compMoves[randomNumber]) and to lose you chose \(answer)"
                }
            }
            if compMoves[randomNumber] == "paper" {
                if answer == "rock" {
                    playerScore = playerScore + 1
                    scoreTitle = "Correct, computer chose \(compMoves[randomNumber]) and to lose you chose \(answer)"
                }
                else {
                    playerScore = (playerScore > 0) ? (playerScore - 1) : playerScore
                    scoreTitle = "Incorrect, computer chose \(compMoves[randomNumber]) and to lose you chose \(answer)"
                }
            }
            if compMoves[randomNumber] == "scissors" {
                if answer == "paper" {
                    playerScore = playerScore + 1
                    scoreTitle = "Correct, computer chose \(compMoves[randomNumber]) and to lose you chose \(answer)"
                }
                else {
                    playerScore = (playerScore > 0) ? (playerScore - 1) : playerScore
                    scoreTitle = "Incorrect, computer chose \(compMoves[randomNumber]) and to lose you chose \(answer)"
                }
            }
            
        }
        showingScore = true
    }
    func newQuestion() {
        questionsDone = questionsDone + 1
        playerWins.toggle()
        compMoves.shuffle()
        if questionsDone == 10 {
            showFinalScore = true
            
        }
    }
    func newGame() {
        questionsDone = 0
        playerWins.toggle()
        compMoves.shuffle()
        playerScore = 0
        
    }
}





#Preview {
    ContentView()
}
