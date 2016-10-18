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
        /*let imageView = self
        let url = URL(fileURLWithPath: imageURL)
        /*DispatchQueue.global().async {
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }*/
        let data = try? Data(contentsOf: url)
        if data != nil{
            print("OK")
            imageView.image = UIImage(data: data!)
        }
        else{
            print("nil")
        }*/
        
        let url = URL(string: imageURL)!
        
        // Download task:
        // - sharedSession = global NSURLCache, NSHTTPCookieStorage and NSURLCredentialStorage objects.
        let task = URLSession.shared.dataTask(with: url) {
            (responseData, responseUrl, error) -> Void in
            
            if let data = responseData{
                
                // execute in UI thread
                DispatchQueue.main.async(execute: { () -> Void in
                    self.image = UIImage(data: data)
                })
            }
        }
        
        task.resume()
    }
    
    
   
}
