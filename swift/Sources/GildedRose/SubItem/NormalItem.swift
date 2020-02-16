//
//  NormalItem.swift
//  
//
//  Created by siroratt suntronsuk on 16/2/2563 BE.
//

protocol SubItemBehavior {
    var getNewQualityPreSellIn: (_ item: Item) -> Int { set get }
    var getNewQualityPostSellIn: (_ quality: Int) -> Int { set get }
}

struct NormalItem: SubItemBehavior {
    var getNewQualityPostSellIn: (Int) -> Int = { quality in
        return quality > 0 ? quality - 1: quality
    }
    
    var getNewQualityPreSellIn: (Item) -> Int = { item in
        return item.quality > 0 ? item.quality - 1: item.quality
    }
}
