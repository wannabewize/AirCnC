//
//  ViewController.swift
//  AirCnC
//
//  Created by wannabewize on 2018. 4. 13..
//  Copyright © 2018년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 콘텐트
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var depthLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    // 이미지 갤러리
    var currentImageIndex = 0
    let images = [
        "hattefjall_1",
        "hattefjall_2",
        "hattefjall_3",
        "hattefjall_4",
        "hattefjall_5"
    ]
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        imageView.image = UIImage.init(named: "hattefjall")
        
        titleLabel.text = "HATTEFJÄLL"
        
        userImageView.image = #imageLiteral(resourceName: "jungyeon")
        userNameLabel.text = "정연"
        
        priceLabel.text = "10,000"
        depthLabel.text = "68cm"
        widthLabel.text = "68cm"
        heightLabel.text = "110cm"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
