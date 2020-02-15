
public enum ItemName: String {
    case agedBrie = "Aged Brie"
    case backstagePasses = "Backstage passes to a TAFKAL80ETC concert"
    case sulfuras = "Sulfuras, Hand of Ragnaros"
}
public class GildedRose {
    let items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        for i in 0..<items.count {
            if (items[i].name != ItemName.agedBrie.rawValue && items[i].name != ItemName.backstagePasses.rawValue) {
                if (items[i].quality > 0) {
                    if (items[i].name != ItemName.sulfuras.rawValue) {
                        items[i].quality = items[i].quality - 1
                    }
                }
            } else {
                if (items[i].quality < 50) {
                    items[i].quality = items[i].quality + 1
                    
                    if (items[i].name == ItemName.backstagePasses.rawValue) {
                        if (items[i].sellIn < 11) {
                            if (items[i].quality < 50) {
                                items[i].quality = items[i].quality + 1
                            }
                        }
                        
                        if (items[i].sellIn < 6) {
                            if (items[i].quality < 50) {
                                items[i].quality = items[i].quality + 1
                            }
                        }
                    }
                }
            }
            
            if (items[i].name != ItemName.sulfuras.rawValue) {
                items[i].sellIn = items[i].sellIn - 1
            }
            
            if (items[i].sellIn < 0) {
                if (items[i].name != ItemName.agedBrie.rawValue) {
                    if (items[i].name != ItemName.backstagePasses.rawValue) {
                        if (items[i].quality > 0) {
                            if (items[i].name != ItemName.sulfuras.rawValue) {
                                items[i].quality = items[i].quality - 1
                            }
                        }
                    } else {
                        items[i].quality = items[i].quality - items[i].quality
                    }
                } else {
                    if (items[i].quality < 50) {
                        items[i].quality = items[i].quality + 1
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
