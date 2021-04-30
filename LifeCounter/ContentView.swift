//
//  ContentView.swift
//  LifeCounter
//
//  Created by Isabella Heppe on 4/21/21.
//

import SwiftUI

struct ContentView: View {
    @State var loser = "No losers so far!"
    @ObservedObject var playerArr = PlayerArr()
    @State var historyArr = [String]()
    @State var gameStart = false
    
    var body: some View {
        NavigationView{
            VStack {
                List {
                    ForEach(playerArr.players, id: \.num) { currPlayer in
                        PlayerData(player: currPlayer, loser: $loser, historyArr: $historyArr, gameStart: $gameStart)
                    }
                }
                Spacer()
                Group {
                    NavigationLink(destination: History(historyArr: historyArr)) {
                        Text("View History")
                    }
                    Spacer()
                    Button(action: self.AppendPlayer, label: {
                        Text("Add Another Player")
                    })
                    .disabled(gameStart == true || playerArr.players.count >= 8)
                    Spacer()
                    Button(action: self.RemovePlayer, label: {
                        Text("Remove Player")
                    })
                    .disabled(gameStart == true || playerArr.players.count <= 2)
//                    Spacer()
//                    Button(action: {
//                        gameStart = true
//                        print(gameStart)
//                        ReinitializePlayer()
//                        historyArr = []
//                        loser = "No losers so far!"
//                    }, label: {
//                        Text("Reset Game")
//                    })
                    Spacer()
                    Text(loser)
                }
                Spacer()
            
            }
        }
    }
    
    private func AppendPlayer() {
        let num = playerArr.players.count + 1
        playerArr.players.append(Player(num))
    }
    
    private func RemovePlayer() {
        playerArr.players.removeLast()
    }
    
    private func ReinitializePlayer() {
        func reinitialize() {
            playerArr.players = [
                Player(1),
                Player(2),
                Player(3),
                Player(4)
            ]
            for p in playerArr.players {
                p.lives = 20
            }
        }
    }
}

struct History: View {
    var historyArr: [String]
    var body: some View {
        ScrollView {
            ForEach(historyArr, id: \.self) { item in
                Text(item)
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 8")
            ContentView()
        }
    }
}

class PlayerArr: ObservableObject {
    @Published var players: [Player] = []
    init() {
        players = [
            Player(1),
            Player(2),
            Player(3),
            Player(4)
        ]
    }
}

struct PlayerData: View {
    @State var player: Player
    @Binding var loser: String
    @ObservedObject var input = NumbersOnly()
    @State var lives = 20
    @State var lost = false
    @ObservedObject var posInput = NumbersOnly()
    @Binding var historyArr: [String]
    @Binding var gameStart: Bool
    
    var body: some View {
        Group {
            HStack {
                Text(verbatim: player.name)
                Spacer()
                Text(verbatim: "Life Total: " + String(player.lives))
            }
            HStack {
                Spacer()
                Button(action: {
                    let playerName = player.name
                    if (input.value != "") {
                        gameStart = true
                        player.lives -= Int(input.value)!
                        var historyStr = ""
                        historyStr = playerName + " lost " + input.value + " lives"
                        historyArr.append(historyStr)
                    }
                    
                    if (player.lives <= 0) {
                        loser = playerName + " lost!"
                    }
                }) {
                    Text("-")
                }
                .frame(width: 25.0, height: 25.0)
                .buttonStyle(BorderlessButtonStyle())
                TextField("", text: $input.value)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:50, height: 25)
                Button(action: {
                    gameStart = true
                    let playerName = player.name
                    player.lives += -1
                    let historyStr = playerName + " lost 1 life"
                    historyArr.append(historyStr)
                    if (player.lives <= 0) {
                        loser = playerName + " lost!"
                    }
                }) {
                    Text("-")
                }
                .frame(width: 25.0, height: 25.0)
                .buttonStyle(BorderlessButtonStyle())
                Button(action: {
                    gameStart = true
                    player.lives += 1
                    let historyStr = player.name + " gained 1 life"
                    historyArr.append(historyStr)
                }) {
                    Text("+")
                }
                .frame(width: 25.0, height: 25.0)
                .buttonStyle(BorderlessButtonStyle())
                Button(action: {
                    if (posInput.value != "") {
                        gameStart = true
                        player.lives += Int(posInput.value)!
                        let playerName = player.name
                        let historyStr = playerName + " gained " + posInput.value + " lives"
                        historyArr.append(historyStr)
                    }
                }) {
                    Text("+")
                }
                .frame(width: 25.0, height: 25.0)
                .buttonStyle(BorderlessButtonStyle())
                TextField("", text: $posInput.value)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:50, height: 25)
                Spacer()
            }
        }
    }
    
}

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}
