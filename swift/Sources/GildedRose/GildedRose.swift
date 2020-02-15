public class GildedRose {
    let items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        items.forEach {
            $0.updateQualityBeforeSellIn()
            $0.updateSellIn()
            $0.updateQualityAfterSellIn()
        }
    }
    
}
