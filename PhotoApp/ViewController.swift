//
//  ViewController.swift
//  PhotoApp
//
//  Created by Galina Podstrechnaya on 7/23/18.
//  Copyright © 2018 Girls Who Code. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate,
UIImagePickerControllerDelegate {
    
     @IBOutlet weak var mainImage: UIImageView!
  
    var imagePickerController: UIImagePickerController!

    @IBAction func savePhoto(_ sender: Any) {
        saveImage(imageName: "galina.png")
    }
    
    
    @IBAction func takePhoto(_ sender: Any) {
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePickerController.dismiss(animated: true, completion: nil)
        mainImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    func saveImage(imageName: String) {
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,
                                                             true)[0] as NSString).appendingPathComponent(imageName)
        
        let image = mainImage.image!
        let imageData = UIImagePNGRepresentation(image)
        fileManager.createFile(atPath: imagePath as String, contents: imageData, attributes: nil)
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

