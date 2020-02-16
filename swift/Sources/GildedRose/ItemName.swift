//
//  ItemName.swift
//  
//
//  Created by siroratt suntronsuk on 16/2/2563 BE.
//

public enum ItemName: String {
    case agedBrie
    case backstagePasses
    case sulfuras
    case normal
    
    public init(rawValue: String) {
        switch rawValue {
        case "Aged Brie": self = .agedBrie
        case "Backstage passes to a TAFKAL80ETC concert": self = .backstagePasses
        case "Sulfuras, Hand of Ragnaros": self = .sulfuras
        default: self = .normal
        }
    }
    static func isNormalItem(_ name: String) -> Bool {
        return ItemName(rawValue: name) == .normal
    }
}
