//
//  UIImage+Cropping.swift
//  SwagFlix
//
//  Created by Manouana on 18/10/2016.
//  Copyright © 2016 Manouanachristopher. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    
    func loadImageFromUrl(_ imageURL :String){
        let url = URL(string: imageURL)!
       
        let task = URLSession.shared.dataTask(with: url) {
            (responseData, responseUrl, error) -> Void in
            
            if let data = responseData{
                
                DispatchQueue.main.async(execute: { () -> Void in
                    self.image = UIImage(data: data)
                })
            }
        }
        
        task.resume()
    }
    
    
   
}
