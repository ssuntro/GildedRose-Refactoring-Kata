//
//  ItemName.swift
//  
//
//  Created by siroratt suntronsuk on 16/2/2563 BE.
//

public enum ItemName: String {
    case agedBrie = "Aged Brie"
    case backstagePasses = "Backstage passes to a TAFKAL80ETC concert"
    case sulfuras = "Sulfuras, Hand of Ragnaros"
    
    static func isNormalItem(_ name: String) -> Bool {
        return ItemName(rawValue: name) == nil
    }
}
