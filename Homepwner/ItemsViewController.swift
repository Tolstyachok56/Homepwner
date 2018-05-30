//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Виктория Бадисова on 29.05.2018.
//  Copyright © 2018 Виктория Бадисова. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewInsets()
        setTableViewBackgroundImage()
    }
    
    //MARK: - Configure UI
    func setTableViewInsets() {
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    func setTableViewBackgroundImage() {
        let imageView = UIImageView(image: UIImage(named: "house"))
        imageView.contentMode = .scaleAspectFill
        tableView.backgroundView = imageView
        
        imageView.topAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
    }
    
    //MARK: - UITableViewDataSource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        if indexPath.row < itemStore.allItems.count {
            let item = itemStore.allItems[indexPath.row]
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "$\(item.valueInDollars)"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 20)
        } else {
            cell.textLabel?.text = "No more items!"
            cell.detailTextLabel?.text = ""
        }
        cell.backgroundColor = .clear
        return cell
    }
    
    //MARK: - UITableViewDelegate methods
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < itemStore.allItems.count {
            return 60
        } else {
            return 44
        }
    }
    
}
