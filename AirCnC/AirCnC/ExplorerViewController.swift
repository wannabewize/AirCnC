//
//  ExplorerViewController.swift
//  AirCnC
//
//  Created by wannabewize on 2018. 4. 13..
//  Copyright © 2018년 wannabewize. All rights reserved.
//

import UIKit



class ExplorerViewController: UITableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Couch.shared.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        let item = Couch.shared.items[indexPath.row]
        let user = item.user
        
        cell.textLabel?.text = item.itemName
        cell.detailTextLabel?.text = user.userName
        cell.imageView?.image = UIImage(named: item.itemImage)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue",
           let detailVC = segue.destination as? ViewController,
           let cell = sender as? UITableViewCell,
           let index = self.tableView.indexPath(for: cell) {
           let item = Couch.shared.items[index.row]
            detailVC.item = item
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
