//
//  Item+.swift
//  
//
//  Created by siroratt suntronsuk on 16/2/2563 BE.
//

extension Item {
    func updateQualityBeforeSellIn() {
        quality = ItemName.init(rawValue: name).item.getNewQualityPreSellIn(self)
    }
    
    func updateSellIn() {
        if ItemName.init(rawValue: name) == ItemName.sulfuras { return }
        
        sellIn =  sellIn - 1
    }
    
    func updateQualityAfterSellIn() {
        if sellIn >= 0 { return }
        
        quality = ItemName.init(rawValue: name).item.getNewQualityPostSellIn(quality)
    }
}
