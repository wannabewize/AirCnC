//
//  ExplorerViewController.swift
//  AirCnC
//
//  Created by wannabewize on 2018. 4. 13..
//  Copyright © 2018년 wannabewize. All rights reserved.
//

import UIKit

struct ItemInfo {
    var userName: String
    var itemName: String
    var itemImage: String
}

class ExplorerViewController: UITableViewController {
    
    var items = [
        ItemInfo(userName: "미나", itemName: "ÄLEBY", itemImage: "aleby"),
        ItemInfo(userName: "사나", itemName: "BROMMÖ", itemImage: "brommo"),
        ItemInfo(userName: "채영", itemName: "EKEDALEN", itemImage: "ekedalen"),
        ItemInfo(userName: "정연", itemName: "HATTEFJÄLL", itemImage: "hattefjall"),
        ItemInfo(userName: "지효", itemName: "MARKUS", itemImage: "markus"),
        ItemInfo(userName: "미나", itemName: "MILLBERGET", itemImage: "millberget"),
        ItemInfo(userName: "모모", itemName: "NORDMYRA", itemImage: "nordmyra"),
        ItemInfo(userName: "나연", itemName: "NORRÅKER", itemImage: "norraker"),
        ItemInfo(userName: "쯔위", itemName: "TUNHOLMEN", itemImage: "tunholmen"),
        ItemInfo(userName: "사나", itemName: "YPPERLIG", itemImage: "ypperlig"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.itemName
        cell.detailTextLabel?.text = item.userName
        cell.imageView?.image = UIImage(named: item.itemImage)

        return cell
    }
}
