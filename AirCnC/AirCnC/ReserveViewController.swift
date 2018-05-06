//
//  ReserveViewController.swift
//  AirCnC
//
//  Created by Jaehoon Lee on 2018. 5. 7..
//  Copyright © 2018년 wannabewize. All rights reserved.
//

import UIKit

class ReserveViewController: UITableViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBAction func handleDone(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleCancel(_ sender: Any) {
        // completion은 default parameter이므로 생략 가능
        self.dismiss(animated: true)
    }
    @IBOutlet weak var fromButton: UIButton!
    @IBOutlet weak var toButton: UIButton!
    @IBOutlet weak var fromDatePicker: UIDatePicker!
    @IBOutlet weak var toDatePicker: UIDatePicker!
    
    var cellHeight: [CGFloat] = [44, 216, 44, 216]
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight[indexPath.row]
    }
    
    @IBAction func handleFrom(_ sender: Any) {
        let indexPath: IndexPath = IndexPath(row: 1, section: 0)
        if cellHeight[1] == 0 {
            cellHeight[1] = 216
            self.tableView.reloadRows(at: [indexPath], with: .none)
        }
        else {
            cellHeight[1] = 0
            self.tableView.reloadRows(at: [indexPath], with: .top)
        }
    }
    
    @IBAction func handleTo(_ sender: Any) {
        if cellHeight[3] == 0 {
            cellHeight[3] = 216
        }
        else {
            cellHeight[3] = 0
        }
        let indexPath: IndexPath = IndexPath(row: 3, section: 0)
        self.tableView.reloadRows(at: [indexPath], with: .bottom)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
