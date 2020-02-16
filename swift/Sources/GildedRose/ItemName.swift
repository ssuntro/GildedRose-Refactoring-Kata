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
    case conjured
    
    public init(rawValue: String) {
        switch rawValue {
        case "Aged Brie": self = .agedBrie
        case "Backstage passes to a TAFKAL80ETC concert": self = .backstagePasses
        case "Sulfuras, Hand of Ragnaros": self = .sulfuras
        case "Conjured Mana Cake": self = .conjured
        default: self = .normal
        }
    }
    
    var item: SubItemBehavior {
        switch self {
        case .agedBrie:
            return AgedBrie()
        case .backstagePasses:
            return BackstagePasses()
        case .sulfuras:
            return Sulfuras()
        case .normal:
            return NormalItem()
        case .conjured:
            return Conjured()
        }
    }
}
