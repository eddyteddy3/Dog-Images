//
//  DogAPIUrl.swift
//  DOG API
//
//  Created by Moazzam Tahir on 22/08/2019.
//  Copyright © 2019 Moazzam Tahir. All rights reserved.
//

import Foundation
import UIKit

class DogApiUrl {
    
    enum EndPoint: String {
        case randomImage = "https://dog.ceo/api/breeds/image/random"
        
        var url: URL {
            return URL(string: EndPoint.randomImage.rawValue)!
        }
    }
    
    class func requestRandomImages(ImageURL url: URL, completionHandle: @escaping (ImageData? ,Error?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("could not load data.")
                completionHandle(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            let imageData = try! decoder.decode(ImageData.self, from: data)
            
            completionHandle(imageData, nil)
            
        }
        
        task.resume()
    }
    
    class func imageData(imageUrl url: URL, completionHandler: @escaping (UIImage?, Error?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("Could not find data.")
                completionHandler(nil, error)
                return
            }
            
            let downloadedImage = UIImage(data: data)
            completionHandler(downloadedImage, nil)
        }
        
        task.resume()
        
    }
    
}
