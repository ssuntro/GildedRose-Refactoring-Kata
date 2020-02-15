
public enum ItemName: String {
    case agedBrie = "Aged Brie"
    case backstagePasses = "Backstage passes to a TAFKAL80ETC concert"
    case sulfuras = "Sulfuras, Hand of Ragnaros"
    
    static func isNormalItem(_ name: String) -> Bool {
        return ItemName(rawValue: name) == nil
    }
}
public class GildedRose {
    let items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        
        for item in items {
            switch item.name {
            case ItemName.agedBrie.rawValue,
                 ItemName.backstagePasses.rawValue:
                if item.quality < 50 {
                    item.quality =  item.quality + 1
                    if item.name == ItemName.backstagePasses.rawValue {
                        if item.sellIn < 11 {
                            if item.quality < 50 {
                                 item.quality =  item.quality + 1
                            }
                        }
                        
                        if item.sellIn < 6 {
                            if item.quality < 50 {
                                 item.quality =  item.quality + 1
                            }
                        }
                    }
                }
            case ItemName.agedBrie.rawValue:
                continue
            default:
                if ItemName.isNormalItem(item.name) {
                    if item.quality > 0 {
                        item.quality =  item.quality - 1
                    }
                }
            }
        }
        
        for item in items {
            if item.name != ItemName.sulfuras.rawValue {
                 item.sellIn =  item.sellIn - 1
            }
        }
        
        for item in items {
            if item.sellIn < 0 {
                if item.name != ItemName.agedBrie.rawValue {
                    if item.name != ItemName.backstagePasses.rawValue {
                        if item.quality > 0 {
                            if item.name != ItemName.sulfuras.rawValue {
                                 item.quality =  item.quality - 1
                            }
                        }
                    } else {
                         item.quality =  item.quality -  item.quality
                    }
                } else {
                    if item.quality < 50 {
                         item.quality =  item.quality + 1
                    }
                }
            }
        }
    }
    public var desciption: String {
        return items.reduce("") { (result, item) -> String in
            return result + item.description + "\n"
        }
    }
}
