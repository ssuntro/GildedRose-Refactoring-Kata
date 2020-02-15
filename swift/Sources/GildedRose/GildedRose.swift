
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
    
    private func getNewQualityForBackstagePasses(with item: Item) -> Int {
        if item.name != ItemName.backstagePasses.rawValue { return item.quality }
        if item.quality >= 50 { return item.quality }
        
        if item.sellIn < 6 {
            return item.quality + 2
        } else if item.sellIn < 11 {
            return item.quality + 1
        } else {
            return item.quality
        }
    }
    
    private func reduceQualityByOne(_ quality: Int) -> Int {
        return quality > 0 ? quality - 1: quality
    }
    public func updateQuality() {
        
        for item in items {
            switch item.name {
            case ItemName.backstagePasses.rawValue,
                 ItemName.agedBrie.rawValue:
                if item.quality >= 50 { continue }
                item.quality =  item.quality + 1
                item.quality = getNewQualityForBackstagePasses(with: item)
            case ItemName.agedBrie.rawValue:
                continue
            default:
                if ItemName.isNormalItem(item.name) {
                    item.quality =  reduceQualityByOne(item.quality)
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
