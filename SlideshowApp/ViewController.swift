//
//  ViewController.swift
//  SlideshowApp
//
//  Created by MacUser on 2021/04/16.
//

import UIKit

class ViewController: UIViewController {
    
    let images = ["blog1.jpg",
                  "blog2.jpg",
                  "blog3.jpg"
    ]
    
    
    var imageIndex = 0
    var myTimer: Timer!
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var oNextButton: UIButton!
    @IBOutlet weak var oBackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageview.image = UIImage(named:images[0])
    }
    
    @IBAction func next(_ sender: Any) {
        imageIndex += 1
        
        if imageIndex == 3 {
            imageIndex = 0
        }
        imageview.image = UIImage(named:images[imageIndex])
    }
    
    @IBAction func back(_ sender: Any) {
        imageIndex -= 1
        
        if imageIndex == -1 {
            imageIndex = 2
        }
        
        imageview.image = UIImage(named:images[imageIndex])
    }
    
    @IBAction func playstop(_ sender: Any) {
        
        if myTimer == nil {
            myTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideShowAction), userInfo: nil, repeats: true)
            oNextButton.isEnabled = false
            oBackButton.isEnabled = false
        } else {
            myTimer.invalidate()
            myTimer = nil
            oNextButton.isEnabled = true
            oBackButton.isEnabled = true
        }
        
        
    }
    
    @objc func slideShowAction(_ timer: Timer) {
        imageIndex += 1
        
        if imageIndex == 3 {
            imageIndex = 0
        }
        
        imageview.image = UIImage(named:images[imageIndex])
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let scaleVC: ScaleViewController = segue.destination as! ScaleViewController
        
        if myTimer == nil {
            scaleVC.imageFile = images[imageIndex]
        } else {
            myTimer.invalidate()
            myTimer = nil
            oNextButton.isEnabled = true
            oBackButton.isEnabled = true
            scaleVC.imageFile = images[imageIndex]
        }
        // segueから遷移先のResultViewControllerを取得する
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
//        resultViewController.x = 1
//        resultViewController.y = 1
    }
    
}

