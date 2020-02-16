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
    var getNewQualityPreSellIn: (Item) -> Int = { item in
        return item.quality > 0 ? item.quality - 1: item.quality
    }
    
    var getNewQualityPostSellIn: (Int) -> Int = { quality in
        return quality > 0 ? quality - 1: quality
    }
}


struct Conjured: SubItemBehavior {
    var getNewQualityPreSellIn: (Item) -> Int = { item in
        return item.quality > 0 ? item.quality - 2: item.quality
    }
    
    var getNewQualityPostSellIn: (Int) -> Int = { quality in
        return quality > 0 ? quality - 2: quality
    }
}
