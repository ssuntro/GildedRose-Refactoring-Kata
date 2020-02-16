//
//  Sulfuras.swift
//  
//
//  Created by siroratt suntronsuk on 16/2/2563 BE.
//

struct Sulfuras: SubItemBehavior {
    var getNewQualityPostSellIn: (Int) -> Int = { $0 }
    
    var getNewQualityPreSellIn: (Item) -> Int = { item in
        return item.quality
    }
}
