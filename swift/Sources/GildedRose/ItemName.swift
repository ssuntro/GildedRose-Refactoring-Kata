//
//  ItemName.swift
//  
//
//  Created by siroratt suntronsuk on 16/2/2563 BE.
//


protocol SubItemBehavior {
    var getNewQualityPreSellIn: (_ item: Item) -> Int { set get }
}

struct BackstagePasses: SubItemBehavior {
    var getNewQualityPreSellIn: (Item) -> Int = { item in
        if item.quality >= 50 { return item.quality }
        
        let result = item.quality + 1
        if result >= 50 { return result }
        if item.sellIn < 6 {
            return result + 2
        } else if item.sellIn < 11 {
            return result + 1
        } else {
            return result
        }
    }
}
struct AgedBrie: SubItemBehavior {
    var getNewQualityPreSellIn: (Item) -> Int = { item in
        if item.quality >= 50 { return item.quality }
        else { return item.quality + 1 }
    }
}
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
    
//    var subItem: SubItemBehavior {
//        
//    }
}
