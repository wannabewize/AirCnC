//
//  ReservationViewController.swift
//  AirCnC
//
//  Created by wannabewize on 2018. 5. 16..
//  Copyright © 2018년 wannabewize. All rights reserved.
//

import UIKit

protocol ReservationDateProtocol: class {
    func handleReservationDate(from: Date, to: Date)
}

class DateSettingViewController: UIViewController {

    @IBOutlet weak var fromDatePicker: UIDatePicker!
    @IBOutlet weak var toDatePicker: UIDatePicker!
    
    weak var delegate: ReservationDateProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func handleCancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func handleDone(_ sender: Any) {
        if let delegate = delegate {
            delegate.handleReservationDate(from: fromDatePicker.date, to: toDatePicker.date)
        }
        self.dismiss(animated: true, completion: nil)
    }
}
