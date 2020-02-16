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

class NormalItem: SubItemBehavior {
    var decreaseRate: Int {
        return 1
    }
    
    lazy var getNewQualityPreSellIn: (Item) -> Int = { [weak self] item in
        guard  let self = self else { return item.quality }
        return item.quality > 0 ? item.quality - self.decreaseRate: item.quality
    }
    
    lazy var getNewQualityPostSellIn: (Int) -> Int = { [weak self] quality in
        guard  let self = self else { return quality }
        return quality > 0 ? quality - self.decreaseRate: quality
    }
}
