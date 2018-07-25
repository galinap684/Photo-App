//
//  GalleryViewController.swift
//  PhotoApp
//
//  Created by Galina Podstrechnaya on 7/24/18.
//  Copyright © 2018 Girls Who Code. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var secondImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage(imageName: "galina.png")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getImage(imageName: String) {
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,
                                                             true)[0] as NSString).appendingPathComponent(imageName)
        
        if fileManager.fileExists(atPath: imagePath) {
            secondImage.image = UIImage(contentsOfFile: imagePath)
        } else {
            print("Oh no! No Image!")
        }
        
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
