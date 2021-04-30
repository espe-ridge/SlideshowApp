//
//  ScaleViewController.swift
//  SlideshowApp
//
//  Created by 新宅 千晶 on 27/04/2021.
//

import UIKit

class ScaleViewController: UIViewController {
    
    var imageFile: String = ""

    @IBOutlet weak var scaleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scaleImageView.image = UIImage(named: imageFile)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
