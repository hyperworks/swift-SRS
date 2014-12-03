// Playground - noun: a place where people can play

import UIKit


let MAX_QUALITY = 5
let QUALITY_SUBTRACTOR = 5
let E_FACTOR_FLOOR:Float = 1.3

struct Card {
    var eFactor: Float = 2.5
    var id: String?
    var count: Int = 0
    var interval: Int = 0
    var lastTime: NSDate
//    public String title;
}

//Score a Card and set it's correct E-Factor.
func scoreCard(inout card:Card, quality:Int) {
    let qFactor:Float = Float((QUALITY_SUBTRACTOR - quality))
    var newFactor:Float = card.eFactor + (0.1 - qFactor * (0.08 + qFactor * 0.02))
    if (newFactor < E_FACTOR_FLOOR) {
        newFactor = E_FACTOR_FLOOR;
    }
    card.eFactor = newFactor
}

func calcuateInterval(inout card:Card) {
    if (card.eFactor < 3) {
        card.count = 1
    }
    let count = card.count
    var interval = 1
    if (count == 2) {
        interval = 6
    } else if (count > 2) {
        card.interval =  Int(round(Float(card.interval) * card.eFactor))
    }
    card.interval = interval
}