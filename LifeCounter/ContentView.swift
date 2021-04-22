//
//  ContentView.swift
//  LifeCounter
//
//  Created by Isabella Heppe on 4/21/21.
//

import SwiftUI

struct ContentView: View {
    @State var lifeTotal1 = 20
    @State var lifeTotal2 = 20
    @State var lifeTotal3 = 20
    @State var lifeTotal4 = 20
    var body: some View {
        VStack {
            Spacer()
            Group {
                Text("Player 1")
                Text("Life Total: " + String(lifeTotal1))
                HStack {
                    Button(action: {
                        self.lifeTotal1 += -5
                    }) {
                        Text("-5")
                    }
                    .frame(width: 25.0, height: 25.0)
                    Button(action: {
                        self.lifeTotal1 += -1
                    }) {
                        Text("-")
                    }
                    .frame(width: 25.0, height: 25.0)
                    Button(action: {
                        self.lifeTotal1 += 1
                    }) {
                        Text("+")
                    }
                    .frame(width: 25.0, height: 25.0)
                    Button(action: {
                        self.lifeTotal1 += 5
                    }) {
                        Text("+5")
                    }
                    .frame(width: 25.0, height: 25.0)
                }
                Spacer()
            }
            Group {
                Text("Player 2")
                Text("Life Total: " + String(lifeTotal2))
                HStack {
                    Button(action: {
                        self.lifeTotal2 += -5
                    }) {
                        Text("-5")
                    }
                    .frame(width: 25.0, height: 25.0)
                    Button(action: {
                        self.lifeTotal2 += -1
                    }) {
                        Text("-")
                    }
                    .frame(width: 25.0, height: 25.0)
                    Button(action: {
                        self.lifeTotal2 += 1
                    }) {
                        Text("+")
                    }
                    .frame(width: 25.0, height: 25.0)
                    Button(action: {
                        self.lifeTotal2 += 5
                    }) {
                        Text("+5")
                    }
                    .frame(width: 25.0, height: 25.0)
                }
                Spacer()
            }
            Group {
                Text("Player 3")
                Text("Life Total: " + String(lifeTotal3))
                HStack {
                    Button(action: {
                        self.lifeTotal3 += -5
                    }) {
                        Text("-5")
                    }
                    .frame(width: 25.0, height: 25.0)
                    Button(action: {
                        self.lifeTotal3 += -1
                    }) {
                        Text("-")
                    }
                    .frame(width: 25.0, height: 25.0)
                    Button(action: {
                        self.lifeTotal3 += 1
                    }) {
                        Text("+")
                    }
                    .frame(width: 25.0, height: 25.0)
                    Button(action: {
                        self.lifeTotal3 += 5
                    }) {
                        Text("+5")
                    }
                    .frame(width: 25.0, height: 25.0)
                }
                Spacer()
            }
            Group {
                Text("Player 4")
                Text("Life Total: " + String(lifeTotal4))
                HStack {
                    Button(action: {
                        self.lifeTotal4 += -5
                    }) {
                        Text("-5")
                    }
                    .frame(width: 25.0, height: 25.0)
                    Button(action: {
                        self.lifeTotal4 += -1
                    }) {
                        Text("-")
                    }
                    .frame(width: 25.0, height: 25.0)
                    Button(action: {
                        self.lifeTotal4 += 1
                    }) {
                        Text("+")
                    }
                    .frame(width: 25.0, height: 25.0)
                    Button(action: {
                        self.lifeTotal4 += 5
                    }) {
                        Text("+5")
                    }
                    .frame(width: 25.0, height: 25.0)
                }
                Spacer()
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
