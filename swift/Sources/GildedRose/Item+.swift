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
        if ItemName.init(rawValue: name) != ItemName.backstagePasses { return quality }
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
        switch ItemName.init(rawValue: name) {
        case .backstagePasses,
             .agedBrie:
            if quality >= 50 { return }
            quality =  quality + 1
            updateQualityForBackstagePasses()
        case .sulfuras:
            return
        case .normal:
            decreaseQuality()
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
