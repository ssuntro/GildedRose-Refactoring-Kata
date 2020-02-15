public class GildedRose {
    let items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        items.forEach {
            $0.updateQualityBeforeSellIn()
        }
        updateTotalSellIn()
        updateQualityAfterSellIn()
    }
    
    private func updateTotalSellIn() {
        for item in items {
            if item.name != ItemName.sulfuras.rawValue {
                 item.sellIn =  item.sellIn - 1
            }
        }
    }
    
    private func updateQualityAfterSellIn() {
        for item in items {
            if item.sellIn >= 0 { continue }
            
            switch item.name {
            case ItemName.backstagePasses.rawValue:
                item.setZeroQuality()
            case ItemName.agedBrie.rawValue:
                item.increaseQuality()
            default:
                if ItemName.isNormalItem(item.name) {
                    item.decreaseQuality()
                }
            }
        }
    }
}
