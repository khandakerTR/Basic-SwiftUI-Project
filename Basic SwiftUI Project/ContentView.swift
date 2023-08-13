//
//  ContentView.swift
//  Basic SwiftUI Project
//
//  Created by Tushar Khandaker on 13/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerScore = 0
    @State var cpuScore = 0
    @State var playerCard = "card2"
    @State var cpuCard = "card2"
    @State private var showAlert = false
    @State var totalPlayedRound = 0
    @State var isPlayerWon:Bool? = nil
    
    
    var body: some View {
        ZStack {
            Image("background").ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button {
                    
                    let pRand = Int.random(in: 2...14)
                    let cRand = Int.random(in: 2...14)
                    playerCard = "card\(pRand)"
                    cpuCard = "card\(cRand)"
                    if pRand > cRand {
                        playerScore += 1
                    } else  if cRand > pRand {
                        cpuScore += 1
                    }
                    totalPlayedRound += 1
                    if totalPlayedRound == 10 {
                        if playerScore > cpuScore {
                            isPlayerWon = true
                            showAlert = true
                        } else if cpuScore > playerScore {
                            isPlayerWon = false
                            showAlert = true
                        } else {
                            isPlayerWon = nil
                            showAlert = true
                        }
                        
                        playerScore = 0
                        cpuScore = 0
                        totalPlayedRound = 0
                        playerCard = "card2"
                        cpuCard = "card2"
                    }
                    
                } label: {
                    Image("dealbutton")
                }.alert(isPresented: $showAlert) {
                    if isPlayerWon == nil {
                        return  Alert(title: Text("Tie"), message: Text("Unfortunately the game is Tie"), dismissButton: .default(Text("OK")))
                    } else if isPlayerWon! {
                        return  Alert(title: Text("Congratulation"), message: Text("You Won"), dismissButton: .default(Text("OK")))
                    } else {
                        return  Alert(title: Text("Better Luck for Next Time"), message: Text("You loss"), dismissButton: .default(Text("OK")))
                    }
                }

                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player").font(.title).foregroundColor(Color.white).padding(.bottom, 8.0)
                        Text("\(playerScore)").font(.largeTitle).foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack {
                        Text("Round").font(.largeTitle
                        ).foregroundColor(Color.white)
                            .padding(.bottom, 8.0)
                        Text("\(totalPlayedRound)").font(.largeTitle).foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack {
                        Text("CPU").font(.title
                        ).foregroundColor(Color.white)
                            .padding(.bottom, 8.0)
                        Text("\(cpuScore)").font(.largeTitle).foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
