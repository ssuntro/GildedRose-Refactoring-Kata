//
//  BackstagePasses.swift
//  
//
//  Created by siroratt suntronsuk on 16/2/2563 BE.
//

struct BackstagePasses: SubItemBehavior {
    var getNewQualityPostSellIn: (Int) -> Int = { _ in 0 }
    
    var getNewQualityPreSellIn: (Item) -> Int = { item in
        if item.quality >= 50 { return item.quality }
        
        let result = item.quality + 1
        if result >= 50 { return result }
        if item.sellIn < 6 {
            return result + 2
        } else if item.sellIn < 11 {
            return result + 1
        } else {
            return result
        }
    }
}
