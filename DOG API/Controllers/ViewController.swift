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
        
        let task = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            
            guard let data = data else {
                print("Could not find data.")
                return
            }
            
            //to convert JSON into swift object, decodeable will be used
            let decoder = JSONDecoder()
            do {
                let imageData = try decoder.decode(ImageData.self, from: data)
                print("Image Data: \(imageData)")
            } catch {
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
        
    }
    
}
