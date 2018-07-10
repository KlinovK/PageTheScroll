//
//  ViewController.swift
//  PageTheScroll
//
//  Created by Константин Клинов on 6/28/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

  

    @IBOutlet weak var imageView: UIImageView!
    
    let imageNames = ["icon0.png","icon1.png","icon2.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeftGesture=UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        imageView.isUserInteractionEnabled = true
        swipeLeftGesture.direction = UISwipeGestureRecognizerDirection.left
        imageView.addGestureRecognizer(swipeLeftGesture)
        
        let swipeRightGesture=UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeRightGesture.direction = UISwipeGestureRecognizerDirection.right
        imageView.addGestureRecognizer(swipeRightGesture)
    }
    
    var currentImage = 0
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.left:
                if currentImage == imageNames.count - 1 {
                    currentImage = 0
                    
                } else {
                    currentImage += 1
                }
                imageView.image = UIImage(named: imageNames[currentImage])
                
            case UISwipeGestureRecognizerDirection.right:
                if currentImage == 0 {
                    currentImage = imageNames.count - 1
                } else {
                    currentImage -= 1
                }
                imageView.image = UIImage(named: imageNames[currentImage])
            default:
                break
            }
        }
}
}
