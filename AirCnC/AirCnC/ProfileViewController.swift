//
//  ProfileViewController.swift
//  AirCnC
//
//  Created by Jaehoon Lee on 2018. 5. 7..
//  Copyright © 2018년 wannabewize. All rights reserved.
//

import UIKit

class ReservationCell: UITableViewCell {
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var fromDateLabel: UILabel!
    @IBOutlet weak var toDateLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
}

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dateFormatter: DateFormatter!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Reservation.shared.reserves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReserveCell", for: indexPath) as! ReservationCell
        let reserveInfo = Reservation.shared.reserves[indexPath.row]
        
        cell.itemNameLabel.text = reserveInfo.item.itemName
        cell.itemImageView.image = UIImage(named: reserveInfo.item.itemImage)
        cell.fromDateLabel.text = dateFormatter.string(from: reserveInfo.from)
        cell.toDateLabel.text = dateFormatter.string(from: reserveInfo.to)
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
