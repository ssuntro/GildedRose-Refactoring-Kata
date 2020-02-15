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
    
    func updateQualityForBackstagePasses() {
        quality = calculateQualityForBackstagePasses
    }
    
    private var calculateQualityForBackstagePasses: Int {
        if name != ItemName.backstagePasses.rawValue { return quality }
        if quality >= 50 { return quality }
        
        if sellIn < 6 {
            return quality + 2
        } else if sellIn < 11 {
            return quality + 1
        } else {
            return quality
        }
    }
    
    
    
    func updateQualityBeforeSellIn() {
        switch name {
        case ItemName.backstagePasses.rawValue,
             ItemName.agedBrie.rawValue:
            if quality >= 50 { return }
            quality =  quality + 1
            updateQualityForBackstagePasses()
        case ItemName.agedBrie.rawValue:
            return
        default:
            if ItemName.isNormalItem(name) {
                decreaseQuality()
            }
        }
    }
}
