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
}
