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
    @State var shouldWin: Bool = Bool.random()
    @State var playerScore: Int = 0
    
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
        // Logic here needs to be adjusted to the actual game mechanic
        if move == possibleMoves[cpuChoice] && shouldWin {
            playerScore += 1
        } else if move != possibleMoves[cpuChoice] && !shouldWin {
            playerScore += 1
        } else {
            print("Nothing")
        }
        
        cpuChoice = Int.random(in: 0..<3)
        shouldWin = Bool.random()
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
