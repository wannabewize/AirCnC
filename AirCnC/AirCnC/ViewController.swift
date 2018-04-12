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
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
