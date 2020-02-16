//
//  Item+.swift
//  
//
//  Created by siroratt suntronsuk on 16/2/2563 BE.
//

extension Item {
//    func increaseQuality() {
//        quality = (quality < 50 ? quality + 1: quality)
//    }
//    
//    func decreaseQuality() {
//        quality = (quality > 0 ? quality - 1: quality)
//    }
    
    func updateQualityBeforeSellIn() {
        quality = ItemName.init(rawValue: name).item.getNewQualityPreSellIn(self)
    }
    
    func updateSellIn() {
        if ItemName.init(rawValue: name) != ItemName.sulfuras {
             sellIn =  sellIn - 1
        }
    }
    
    func updateQualityAfterSellIn() {
        if sellIn >= 0 { return }
        
        quality = ItemName.init(rawValue: name).item.getNewQualityPostSellIn(quality)
    }
}
