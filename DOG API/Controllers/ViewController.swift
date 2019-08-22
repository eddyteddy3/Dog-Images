//
//  ViewController.swift
//  DOG API
//
//  Created by Moazzam Tahir on 22/08/2019.
//  Copyright © 2019 Moazzam Tahir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let apiRequestURL = "https://dog.ceo/api/breeds/image/random"

    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showImage(_ sender: Any) {
        
        let apiURL = DogApiUrl.EndPoint.randomImage.url
        
        
        DogApiUrl.requestRandomImages(ImageURL: apiURL) { (imageData, error) in
            
            guard let imageUrl = URL(string: imageData!.message) else {
                print("Could not load URL.")
                return
            }
            
            DogApiUrl.imageData(imageUrl: imageUrl, completionHandler: { (image, error) in
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            })
        }
        
    }
    
}

