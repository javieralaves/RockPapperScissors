//
//  ContentView.swift
//  RockPapperScissors
//
//  Created by Javier Alaves on 5/7/23.
//

import SwiftUI

struct ContentView: View {
    
    let possibleMoves: [String] = ["✊", "✋", "✌️"]
    
    @State private var cpuChoice = Int.random(in: 0..<3)
    @State private var shouldWin: Bool = Bool.random()
    @State private var playerScore: Int = 0
    @State private var round: Int = 0
    
    var body: some View {
        VStack (spacing: 40) {
            VStack (spacing: 10) {
                Text("Player score: \(playerScore)")
                Text("App move is \(possibleMoves[cpuChoice])")
                shouldWin ? Text("Player should win") : Text("Player should lose")
            }
            HStack (spacing: 20) {
                Button {
                    playerMove("✊")
                } label: {
                    Image("rock")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Button {
                    playerMove("✋")
                } label: {
                    Image("paper")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Button {
                    playerMove("✌️")
                } label: {
                    Image("scissors")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
        .padding()
    }
    
    func playerMove(_ move: String) {
        
        if shouldWin {
            
            if possibleMoves[cpuChoice] == "✊" && move == "✋" {
                playerScore += 1
            } else if possibleMoves[cpuChoice] == "✋" && move == "✌️" {
                playerScore += 1
            } else if possibleMoves[cpuChoice] == "✌️" && move == "✊" {
                playerScore += 1
            } else {
                playerScore -= 1
            }
            
        } else {
            if possibleMoves[cpuChoice] == "✊" && move != "✋" {
                playerScore += 1
            } else if possibleMoves[cpuChoice] == "✋" && move != "✌️" {
                playerScore += 1
            } else if possibleMoves[cpuChoice] == "✌️" && move != "✊" {
                playerScore += 1
            } else {
                playerScore -= 1
            }
        }
        
        cpuChoice = Int.random(in: 0..<3)
        shouldWin = Bool.random()
        round += 1
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
