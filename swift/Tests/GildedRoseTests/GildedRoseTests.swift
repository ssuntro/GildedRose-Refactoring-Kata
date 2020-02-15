@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    func testQualityMinimumIs0_whenNormalItem() {
        let store = GildedRose(items: [Item(name: "foo", sellIn: 0, quality: 0)])
        
        store.updateQuality()
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        foo, -2, 0\n
        """)
    }
    
    func testAgedBrieIncreaseQulity_whenDayPassedBy() {}
    
    
    
    func testQualityMaxIs50_agedBrie() {
        let items = [Item(name: "Aged Brie", sellIn: 0, quality: 50)]
        let store = GildedRose(items: items)
        
        store.updateQuality()
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Aged Brie, -2, 50\n
        """)
    }

    func testTwoDayPassedBy() {
        let store = GildedRose(items: [
        Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20),
        Item(name: "Aged Brie", sellIn: 2, quality: 0),
        Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7),
        Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
        Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
        Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20),
        Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49),
        Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 49),
        // this conjured item does not work properly yet
        Item(name: "Conjured Mana Cake", sellIn: 3, quality: 6)])
        
        store.updateQuality()
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
                       +5 Dexterity Vest, 8, 18
                       Aged Brie, 0, 2
                       Elixir of the Mongoose, 3, 5
                       Sulfuras, Hand of Ragnaros, 0, 80
                       Sulfuras, Hand of Ragnaros, -1, 80
                       Backstage passes to a TAFKAL80ETC concert, 13, 22
                       Backstage passes to a TAFKAL80ETC concert, 8, 50
                       Backstage passes to a TAFKAL80ETC concert, 3, 50
                       Conjured Mana Cake, 1, 4\n
                       """)
    }
    
//    static var allTests : [(String, (GildedRoseTests) -> () throws -> Void)] {
//        return [
//            ("testFoo", testFoo),
//        ]
//    }
}

//MARK: - NormalProduct
extension GildedRoseTests {
    func testNormalProduct_decreaseSellIn() {
        let store = GildedRose(items: [Item(name: "foo", sellIn: 2, quality: 0)])
        
        store.updateQuality()
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        foo, 0, 0\n
        """)
    }
    func testNormalProduct_decreaseQuality() {
        let store = GildedRose(items: [Item(name: "foo", sellIn: 2, quality: 2)])
        
        store.updateQuality()
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        foo, 0, 0\n
        """)
    }
    func testNormalProduct_decreaseQualityDouble_whenSellInIs0() {
        let store = GildedRose(items: [Item(name: "foo", sellIn: 0, quality: 2)])
        
        store.updateQuality()
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        foo, -2, 0\n
        """)
        
    }
    func testNormalProduct_decreaseQualityDouble_whenSellInIsMinus() {
        let store = GildedRose(items: [Item(name: "foo", sellIn: -5, quality: 10)])
        
        store.updateQuality()
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        foo, -7, 6\n
        """)
    }
}
