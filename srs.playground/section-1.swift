// Playground - noun: a place where people can play

import UIKit


let MAX_QUALITY = 5
let QUALITY_SUBTRACTOR = 5
let E_FACTOR_FLOOR:Float = 1.3

struct Card {
    var eFactor: Float = 0.0
    var id: String?
    var count: Int = 0
    var interval: Int = 0

    // identifier in the database
    public int id;
    // the cards title
    public String title;
    // urls pointing to the files the card has
    public URL side1;
    public URL side2;
    // the current e-factor for this card
    public float eFactor = 2.5f;
    public int count = 0;
    public Date lastTime;
    public int interval;
    
    public Card(
    int id, String title, URL side1, URL side2, float eFactor) {
    this.id = id;
    this.title = title;
    this.side1 = side1;
    this.side2 = side2;
    this.eFactor = eFactor;
    }
    
    public Card(String title, URL side1, URL side2) {
    this.title = title;
    this.side1 = side1;
    this.side2 = side2;
    this.eFactor = 0;
    }
    
    public int getId() {
    return id;
    }
    
    public float getEFactor() {
    return eFactor;
    }
    
    public void setEFactor(float factor) {
    eFactor = factor;
    }
    
    public int getCount() {
    return count;
    }
    
    public void setCount(int count) {
    this.count = count;
    }
    
    public float getInterval() {
    return interval;
    }
    
    public void setInterval(int interval) {
    this.interval = interval;
    }


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
    var interval:Float = 1
    if (count == 2) {
        interval = 6
    } else if (count > 2) {
        interval =  round(card.interval * card.eFactor);
    }
    card.interval = interval
}