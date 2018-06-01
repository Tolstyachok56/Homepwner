//
//  ImageStore.swift
//  Homepwner
//
//  Created by Виктория Бадисова on 01.06.2018.
//  Copyright © 2018 Виктория Бадисова. All rights reserved.
//

import UIKit

class ImageStore {
    
    let cache = NSCache<NSString, UIImage>()
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func image(forKey key: String) {
        cache.object(forKey: key as NSString)
    }
    
    func deleteImage(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
    }
    
}
