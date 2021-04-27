//
//  PlayerData.swift
//  LifeCounter
//
//  Created by Isabella Heppe on 4/27/21.
//

import SwiftUI

class Player {
    var num: Int
    var name: String
    var lives: Int
    var lost: Bool
    
    init(_ num: Int) {
        self.num = num
        name = "Player " + String(num)
        lives = 20
        lost = false
    }
    
    func changeLives(_ amt: Int) {
        lives += amt
        if (lives <= 0) {
            lost = true
        }
    }
    
    func changeName(_ str: String) {
        name = str
    }
}
