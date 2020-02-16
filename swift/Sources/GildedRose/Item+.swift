//
//  Item+.swift
//  
//
//  Created by siroratt suntronsuk on 16/2/2563 BE.
//

extension Item {
    func increaseQuality() {
        quality = (quality < 50 ? quality + 1: quality)
    }
    
    func decreaseQuality() {
        quality = (quality > 0 ? quality - 1: quality)
    }
    
    func setZeroQuality() {
        quality = 0
    }
    
    
    
    func updateQualityBeforeSellIn() {
        switch ItemName.init(rawValue: name) {
        case .agedBrie:
            quality = AgedBrie().getNewQualityPreSellIn(self)
        case .backstagePasses:
            quality = BackstagePasses().getNewQualityPreSellIn(self)
        case .sulfuras:
            quality = Sulfuras().getNewQualityPreSellIn(self)
        case .normal:
            quality =  NormalItem().getNewQualityPreSellIn(self)
        }
    }
    
    func updateSellIn() {
        if ItemName.init(rawValue: name) != ItemName.sulfuras {
             sellIn =  sellIn - 1
        }
    }
    
    func updateQualityAfterSellIn() {
        if sellIn >= 0 { return }
        
        switch ItemName.init(rawValue: name) {
        case .backstagePasses:
            setZeroQuality()
        case .agedBrie:
            increaseQuality()
        case .sulfuras:
            return
        case .normal:
            decreaseQuality()
        }
    }
}
