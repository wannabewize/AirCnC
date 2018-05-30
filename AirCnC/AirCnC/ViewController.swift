//
//  ViewController.swift
//  AirCnC
//
//  Created by wannabewize on 2018. 4. 13..
//  Copyright © 2018년 wannabewize. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ReservationDateProtocol {
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
    
    @IBOutlet weak var saveButton: UIButton!
    @IBAction func toggleSave(_ sender: Any) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
            let item = item {
            if appDelegate.isSaved(item: item) {
                appDelegate.removeSave(item)
            }
            else {
                appDelegate.addSave(item)
            }
            showSaveButtonTitle()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DateSettingSegue",
            let dateSettingVC = segue.destination as? DateSettingViewController {
            dateSettingVC.delegate = self
        }
    }
    
    @IBOutlet weak var dateSetButton: UIButton!
    var fromDate, toDate: Date?
    func handleReservationDate(from: Date, to: Date) {
        self.fromDate = from
        self.toDate = to
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        let dateStr = "\( dateFormatter.string(from: from)) ~ \( dateFormatter.string(from: to))"        
        dateSetButton.setTitle(dateStr, for: .normal)
    }
    
    func showSaveButtonTitle() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
            let item = item {
            let buttonTitle = appDelegate.isSaved(item: item) ? "UnLike" : "Like"
            saveButton.setTitle(buttonTitle, for: .normal)
        }
    }
    
    @IBAction func handleReserve(_ sender: Any) {
        guard let from = fromDate, let to = toDate else {
            let dialog = UIAlertController(title: "날짜를 설정하세요", message: nil, preferredStyle: .alert)
            dialog.addAction( UIAlertAction(title: "확인", style: .default, handler: nil) )
            self.present(dialog, animated: true, completion: nil)
            return
        }
        
        let dialog = UIAlertController(title: "예약하시겠습니까?", message: nil, preferredStyle: .alert)
        dialog.addAction( UIAlertAction(title: "취소", style: .cancel, handler: nil) )
        dialog.addAction( UIAlertAction(title: "확인", style: .default, handler: { (action) in
            Reservation.shared.addReservation(self.item!, from: from, to: to)
        }))
        self.present(dialog, animated: true, completion: nil)
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
            
            showSaveButtonTitle()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
