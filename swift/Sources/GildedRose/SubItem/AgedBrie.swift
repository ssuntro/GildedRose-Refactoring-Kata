//
//  File.swift
//  
//
//  Created by siroratt suntronsuk on 16/2/2563 BE.
//

struct AgedBrie: SubItemBehavior {
    var getNewQualityPostSellIn: (Int) -> Int = { quality in
        return quality < 50 ? quality + 1: quality
    }
    
    var getNewQualityPreSellIn: (Item) -> Int = { item in
        if item.quality >= 50 { return item.quality }
        else { return item.quality + 1 }
    }
}
