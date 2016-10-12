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
    var title:String?
    var desc: String?
    var picture:String?
    var day_out:Int32?
    var frequecy_out:Int32?
    var hour_alert:Int32?
    var fav:Int32?
    var id:NSManagedObjectID?
    
    override init() {
    }
    
    
    init(title: String, desc: String, picture: String, day_out: Int32, frequecy_out: Int32, hour_alert: Int32, fav: Int32) {
        self.title   = title
        self.desc = desc
        self.picture  = picture
        self.day_out  = day_out
        self.frequecy_out  = frequecy_out
        self.hour_alert  = hour_alert
        self.fav  = fav
    }
    
    init(title: String, desc: String, picture: String, day_out: Int32, frequecy_out: Int32, hour_alert: Int32, fav: Int32, id:NSManagedObjectID) {
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
        myDescription += " title : "+self.title!+","
        myDescription += " desc : "+self.desc!+","
        myDescription += " picture : "+self.picture!+","
        myDescription += " day_out : "+String(describing: self.day_out)+","
        myDescription += " frequecy_out : "+String(describing: self.frequecy_out)+","
        myDescription += " hour_alert : "+String(describing: self.hour_alert)+","
        myDescription += " fav : "+String(describing: self.fav)+","
        myDescription += " id : "+String(describing: self.fav)+","
        myDescription += "}"
        
        return myDescription
    }
    
}
