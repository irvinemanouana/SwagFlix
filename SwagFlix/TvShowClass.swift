//
//  TvShowClass.swift
//  SwagFlix
//
//  Created by Akiro on 09/10/2016.
//  Copyright © 2016 Manouanachristopher. All rights reserved.
//

import Foundation
import CoreData

class TvShowClass: NSObject {
    var title:String
    var desc: String
    var picture:String
    var day_out:String
    var frequecy_out:String
    var hour_alert:String
    var fav:Int32?
    var id:NSManagedObjectID?
    
    
    init(title: String, desc: String, picture: String, day_out: String, frequecy_out: String, hour_alert: String, fav: Int32) {
        self.title   = title
        self.desc = desc
        self.picture  = picture
        self.day_out  = day_out
        self.frequecy_out  = frequecy_out
        self.hour_alert  = hour_alert
        self.fav  = fav
    }
    
    init(title: String, desc: String, picture: String, day_out: String, frequecy_out: String, hour_alert: String, fav: Int32, id:NSManagedObjectID) {
        self.title   = title
        self.desc = desc
        self.picture  = picture
        self.day_out  = day_out
        self.frequecy_out  = frequecy_out
        self.hour_alert  = hour_alert
        self.fav  = fav
        self.id  = id
    }
    
    
    override var description: String{
    
        var myDescription = "TvShowClass {"
        myDescription += " title : "+self.title+","
        myDescription += " desc : "+self.desc+","
        myDescription += " picture : "+self.picture+","
        myDescription += " day_out : "+self.day_out+","
        myDescription += " frequecy_out : "+self.frequecy_out+","
        myDescription += " hour_alert : "+self.hour_alert+","
        myDescription += " fav : "+String(describing: self.fav)+","
        myDescription += " id : "+String(describing: self.fav)+","
        myDescription += "}"
        
        return myDescription
    }
    
}
