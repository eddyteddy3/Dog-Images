//
//  DogAPIUrl.swift
//  DOG API
//
//  Created by Moazzam Tahir on 22/08/2019.
//  Copyright © 2019 Moazzam Tahir. All rights reserved.
//

import Foundation

class DogApiUrl {
    
    enum EndPoint: String {
        case randomImage = "https://dog.ceo/api/breeds/image/random"
        
        var url: URL {
            return URL(string: EndPoint.randomImage.rawValue)!
        }
    }
    
}
