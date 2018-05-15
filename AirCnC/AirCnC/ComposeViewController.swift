//
//  ComposeViewController.swift
//  AirCnC
//
//  Created by Jaehoon Lee on 2018. 5. 15..
//  Copyright © 2018년 wannabewize. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var itemNameLabel: UITextField!
    @IBOutlet weak var itemPriceLabel: UITextField!
    @IBOutlet weak var itemSizeLabel: UITextField!
    
    @IBAction func handleCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleDone(_ sender: Any) {
        if let selectedIndex = tableView.indexPathForSelectedRow {
            // default value parameter는 생략 가능
            
            let selectedItem = items[selectedIndex.row]
            Couch.shared.addItem(selectedItem)
            self.dismiss(animated: true)
        }
        else {
            let dialog = UIAlertController(title: "제품 선택", message: "제품을 선택하세요", preferredStyle:.alert)
            dialog.addAction( UIAlertAction.init(title: "확인", style: .default, handler: nil))
            self.show(dialog, sender: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    
    // 추가할 아이템
    var items: [ItemInfo] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.itemName
        cell.imageView?.image = UIImage.init(named: item.itemImage)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        itemNameLabel.text = item.itemName
        itemPriceLabel.text = "\(item.price)원"
        itemSizeLabel.text = "폭 : \(item.size.w), 깊이 : \(item.size.d), 높이 : \(item.size.h)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items.append(ItemInfo(itemName: "KLIPPAN", itemImage: "KLIPPAN1", price: 14900,
                              detailImage: ["KLIPPAN1", "KLIPPAN2", "KLIPPAN3", "KLIPPAN4"], size: SizeInfo(w: 138, d: 87, h: 67),
                              user: UserInfo(userName: "사나", userImage:"sana")))
        items.append(ItemInfo(itemName: "TIMSFORS", itemImage: "TIMSFORS1", price: 89900,
                              detailImage: ["TIMSFORS1", "TIMSFORS2", "TIMSFORS3", "TIMSFORS4"], size: SizeInfo(w: 175, d: 94, h: 88),
                              user: UserInfo(userName: "정연", userImage:"jungyeon")))
        items.append(ItemInfo(itemName: "KLIPPAN", itemImage: "KLIPPAN1", price: 14900,
                              detailImage: ["KLIPPAN1", "KLIPPAN2", "KLIPPAN3", "KLIPPAN4"], size: SizeInfo(w: 138, d: 87, h: 67),
                              user: UserInfo(userName: "쯔위", userImage:"tzuyu")))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
