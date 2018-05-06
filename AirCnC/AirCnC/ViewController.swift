//
//  ViewController.swift
//  AirCnC
//
//  Created by wannabewize on 2018. 4. 13..
//  Copyright © 2018년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var depthLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    var item: ItemInfo?
    
    var currentImageIndex = 0
    var images: [String] = []
    
    
    @IBAction func showPrevImage(_ sender: Any) {
        if currentImageIndex > 0  {
            currentImageIndex -= 1
        }
        self.showImage(index: currentImageIndex)
    }
    
    @IBAction func showNextImage(_ sender: Any) {
        if currentImageIndex < images.count - 1 {
            currentImageIndex += 1
        }
        self.showImage(index: currentImageIndex)
    }
    
    func showImage(index: Int) {
        let imageName = images[index]
        imageView.image = UIImage(named: imageName)
        
        leftButton.isEnabled = index > 0
        rightButton.isEnabled = index < images.count - 1
    }
    
    // 예약 버튼과 예약 날짜 피커
    @IBOutlet weak var reserveButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    let dateFormatter = DateFormatter()
    
    @IBAction func toggleDatePicker(_ sender: Any) {
        datePicker.isHidden = !datePicker.isHidden
        
        if datePicker.isHidden {
            let selectedDate = dateFormatter.string(from: datePicker.date)
            reserveButton.setTitle(selectedDate, for: .normal)
        }
        else {
            reserveButton.setTitle("예약하기", for: .normal)
        }
    }
    
    @IBAction func toggleSave(_ sender: Any) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.saves.append(self.item!)
        }        
    }
    
    override func viewWillAppear(_ animated: Bool) {        
        if let item = item {
            titleLabel.text = item.itemName
            userNameLabel.text = item.user.userName
            if let imageName = item.user.userImage {
                userImageView.image = UIImage(named: imageName)
            }
            priceLabel.text = String(item.price)
            
            depthLabel.text = "\(item.size.d)cm"
            widthLabel.text = "\(item.size.w)cm"
            heightLabel.text = "\(item.size.h)cm"
            
            images = item.detailImage
            showImage(index: 0)
            
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .medium
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
