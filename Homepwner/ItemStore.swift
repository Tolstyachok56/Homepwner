//
//  ItemStore.swift
//  Homepwner
//
//  Created by Виктория Бадисова on 29.05.2018.
//  Copyright © 2018 Виктория Бадисова. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    func getItemsWorthMoreOrEqualThan(valueInDollars: Int) -> [Item] {
        return allItems.filter { $0.valueInDollars >= valueInDollars}.sorted {$0.valueInDollars > $1.valueInDollars}
    }
    
    func getItemsWorthLessThan(valueInDollars: Int) -> [Item] {
        return allItems.filter { $0.valueInDollars < valueInDollars}.sorted {$0.valueInDollars > $1.valueInDollars}
    }
    
}
