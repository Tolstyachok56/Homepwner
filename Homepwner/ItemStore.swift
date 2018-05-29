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
    
    
    func filterItemsBy(_ price: Int = 50) -> [[Item]] {
        let moreOrEqualThanPrice = allItems.filter { $0.valueInDollars >= price }
        let lessThanPrice = allItems.filter { $0.valueInDollars < price }
        return [moreOrEqualThanPrice, lessThanPrice]
    }
    
}
