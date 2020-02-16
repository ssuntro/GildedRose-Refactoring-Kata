@testable import GildedRose
import XCTest

//MARK: - Conjured Mana Cake
extension GildedRoseTests {
    func testConjured_MinimumQualityIs0() {
        let store = GildedRose(items: [Item(name: "Conjured Mana Cake", sellIn: 0, quality: 2)])
        
        store.updateQuality()
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Conjured Mana Cake, -2, 0\n
        """)
    }
    func testConjured_qualityDecreaseShouldBeDouble() {
        let store = GildedRose(items: [Item(name: "Conjured Mana Cake", sellIn: 2, quality: 10)])
        
        store.updateQuality()
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Conjured Mana Cake, 0, 6\n
        """)
    }
    func testConjured_qualityDecreaseShouldBeQuadruple_whenSellInIsZero() {
        let store = GildedRose(items: [Item(name: "Conjured Mana Cake", sellIn: 0, quality: 10)])
        
        store.updateQuality()
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Conjured Mana Cake, -2, 2\n
        """)
    }
}
class GildedRoseTests: XCTestCase {
    
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
                       Conjured Mana Cake, 1, 2\n
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
    func testNormalProduct_qualityMinimumIs0_whenQualityAlready0() {
        let store = GildedRose(items: [Item(name: "foo", sellIn: 0, quality: 0)])
        
        store.updateQuality()
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        foo, -2, 0\n
        """)
    }
    
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
    
    func testNormalProduct_decreaseQualityDouble_whenSellInIsZero() {
        let store = GildedRose(items: [Item(name: "foo", sellIn: 0, quality: 10)])
        
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        foo, -1, 8\n
        """)
    }
}

//MARK: - AgedBrie
extension GildedRoseTests {
    func testAgedBrie_increaseQulity_whenDayPassedBy_15() {
        let store = GildedRose(items: [Item(name: "Aged Brie", sellIn: 15, quality: 0)])
        
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Aged Brie, 14, 1\n
        """)
    }
    
    func testAgedBrie_increaseQulity_whenDayPassedBy_10() {
        let store = GildedRose(items: [Item(name: "Aged Brie", sellIn: 10, quality: 0)])
        
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Aged Brie, 9, 1\n
        """)
    }
    
    func testAgedBrie_increaseQulity_whenDayPassedBy_9() {
        let store = GildedRose(items: [Item(name: "Aged Brie", sellIn: 9, quality: 0)])
        
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Aged Brie, 8, 1\n
        """)
    }
    
    func testAgedBrie_increaseQulity_whenDayPassedBy_5() {
        let store = GildedRose(items: [Item(name: "Aged Brie", sellIn: 5, quality: 0)])
        
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Aged Brie, 4, 1\n
        """)
    }
    
    func testAgedBrie_increaseQulity_whenDayPassedBy_4() {
        let store = GildedRose(items: [Item(name: "Aged Brie", sellIn: 4, quality: 0)])
        
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Aged Brie, 3, 1\n
        """)
    }
    
    func testAgedBrie_increaseQulity_whenDayPassedBy_0() {
        let store = GildedRose(items: [Item(name: "Aged Brie", sellIn: 0, quality: 0)])
        
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Aged Brie, -1, 2\n
        """)
    }
    
    func testAgedBrie_increaseQulity_whenDayPassedBy_Minus5() {
        let store = GildedRose(items: [Item(name: "Aged Brie", sellIn: -5, quality: 0)])
        
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Aged Brie, -6, 2\n
        """)
    }
    
    func testAgedBrie_qualityMaxIs50_whenQualityAlready50() {
        let store = GildedRose(items: [Item(name: "Aged Brie", sellIn: 0, quality: 50)])
        
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Aged Brie, -1, 50\n
        """)
    }
    
    func testAgedBrie_multiDayPassedBy() {
        let store = GildedRose(items: [Item(name: "Aged Brie", sellIn: 0, quality: 50)])
        
        store.updateQuality()
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Aged Brie, -2, 50\n
        """)
    }
}

//MARK: - Sulfuras, Hand of Ragnaros
extension GildedRoseTests {
    func testSulfuras_noDecreaseQualityAndSellIn() {
        let store = GildedRose(items: [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 40)])
        
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Sulfuras, Hand of Ragnaros, 0, 40\n
        """)
    }
}

//MARK: - Backstage passes to a TAFKAL80ETC concert
extension GildedRoseTests {
    func testBackstagePasses_increaseQuality_whenSellInIs15() {
        let store = GildedRose(items: [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20)])
        
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Backstage passes to a TAFKAL80ETC concert, 14, 21\n
        """)
    }
    
    func testBackstagePasses_increaseQuality_whenSellInIs10() {
        let store = GildedRose(items: [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 20)])
        
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Backstage passes to a TAFKAL80ETC concert, 9, 22\n
        """)
    }
    func testBackstagePasses_increaseQuality_whenSellInIs9() {
        let store = GildedRose(items: [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 9, quality: 20)])
        
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Backstage passes to a TAFKAL80ETC concert, 8, 22\n
        """)
    }
    func testBackstagePasses_increaseQuality_whenSellInIs5() {
        let store = GildedRose(items: [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 20)])
        
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Backstage passes to a TAFKAL80ETC concert, 4, 23\n
        """)
    }
    func testBackstagePasses_increaseQuality_whenSellInIs4() {
        let store = GildedRose(items: [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 4, quality: 20)])
        
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Backstage passes to a TAFKAL80ETC concert, 3, 23\n
        """)
    }
    func testBackstagePasses_increaseQuality_whenSellInIs0() {
        let store = GildedRose(items: [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 20)])
        
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Backstage passes to a TAFKAL80ETC concert, -1, 0\n
        """)
    }
    func testBackstagePasses_QualityIs0_whenSellInIsMinus5() {
        let store = GildedRose(items: [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: -5, quality: 20)])
        
        store.updateQuality()
        
        XCTAssertEqual(store.desciption,
                       """
        Backstage passes to a TAFKAL80ETC concert, -6, 0\n
        """)
    }
    
    func testEnum() {
        XCTAssertEqual(ItemName.init(rawValue: "Aged Brie"), ItemName.agedBrie)
        XCTAssertEqual(ItemName.init(rawValue: "Backstage passes to a TAFKAL80ETC concert"), ItemName.backstagePasses)
        XCTAssertEqual(ItemName.init(rawValue: "Sulfuras, Hand of Ragnaros"), ItemName.sulfuras)
        XCTAssertEqual(ItemName.init(rawValue: "ann ja"), ItemName.normal)
        
    }
}

//MARK: - Test Utilities
extension GildedRose {
    public var desciption: String {
        return items.reduce("") { (result, item) -> String in
            return result + item.description + "\n"
        }
    }
}
