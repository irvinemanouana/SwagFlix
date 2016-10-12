//
//  TvShowDataHelper.swift
//  SwagFlix
//
//  Created by Akiro on 06/10/2016.
//  Copyright © 2016 Manouanachristopher. All rights reserved.
//

import Foundation
import CoreData

class TvShowDataHelper {
    
    static let sharedInstance = TvShowDataHelper()
    var context: NSManagedObjectContext?

    
    //Recuperer un objet a partir de l'id
    //self.context?.object(with: monID)
    
    
    init() {
        let modelUrl = Bundle.main.url(forResource:"SwagFlix", withExtension:"momd")
        let modelSchema = NSManagedObjectModel(contentsOf: modelUrl!)
        let storeCoordinate = NSPersistentStoreCoordinator(managedObjectModel: modelSchema!)
        let documentUrl = FileManager.default.urls(for: .documentDirectory, in:.userDomainMask).first!
        let dbURL = documentUrl.appendingPathComponent("SwagFlix.db")
        
        //print("modeUrl : \(modelUrl)")
        //print("modeSchema : \(modelSchema)")
        
        do{
            try storeCoordinate.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: dbURL, options: nil)
            
            let objectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
            objectContext.persistentStoreCoordinator = storeCoordinate
            self.context = objectContext
            
        }catch{
            print("?")
        }

    }
    
    //--------------------------------------
    //  Recuperation / Affichage
    //--------------------------------------

    func getAllTvShows()->[TvShowClass]{
        var showsClass :[TvShowClass] = []
        
        let request = NSFetchRequest<TvShow>(entityName: "TvShow")
        let shows = try? (self.context?.fetch(request))!
        for show in shows!{
            showsClass.append(TvShowClass(
                title: show.title_show!,
                desc: show.description_show!,
                picture: show.picture_show!,
                day_out: show.day_out_show,
                frequecy_out: show.frequency_out_show,
                hour_alert: show.hour_alert_show,
                fav: show.fav_show,
                id: show.objectID
            ))
        }
        return showsClass
    }
    
    func getAllTvShows()->[TvShow]{
        let request = NSFetchRequest<TvShow>(entityName: "TvShow")
        let shows = try? (self.context?.fetch(request))!
        
        return shows!
    }
    
    
    
    
    
    func displpayAllTvShow(){
        /* 
         //Methode 1
         let request = NSFetchRequest<Person>(entityName: "Person")
         let storeResult = try? self.context?.execute(request) as! NSAsynchronousFetchResult<Person>
         for p in (storeResult?.finalResult)! {
         print("\(p.firstname) \(p.lastname)")
         }
         */
        
        /*
         //Methode 2
         let request = NSFetchRequest<Person>(entityName: "Person")
         let persons = try? self.context?.fetch(request)
         for p in persons!!{
         print("\(p.firstname) \(p.lastname)")
         }
         */
        
        //Methode 3
        let request = NSFetchRequest<TvShow>(entityName: "TvShow")
        let shows = try? (self.context?.fetch(request))!
        for show in shows!{
            print("myShow"+"\(show.title_show) \(show.description_show)")
        }
    }
    
    
    //--------------------------------------
    //  Actions
    //--------------------------------------

    
    
    // -----------
    // Insert
    
    func addTvShow(myTvShowClass: TvShowClass){
        var tvShow = NSEntityDescription.insertNewObject(forEntityName: "TvShow", into: self.context!) as! TvShow

        tvShow = self.getTvShowFromClass(myTvShowClass: myTvShowClass, myTvShow: tvShow)
        
        try? self.context?.save()
    }
    
    // -----------
    // Update

    func updateTvShow(myTvShowClass: TvShowClass){
        do{
            self.context?.object(with: myTvShowClass.id!).setValue(myTvShowClass.title, forKey: "title_show")
            self.context?.object(with: myTvShowClass.id!).setValue(myTvShowClass.desc, forKey: "description_show")
            self.context?.object(with: myTvShowClass.id!).setValue(myTvShowClass.picture, forKey: "picture_show")
            self.context?.object(with: myTvShowClass.id!).setValue(NSNumber(value: myTvShowClass.day_out!), forKey: "frequency_out_show")
            self.context?.object(with: myTvShowClass.id!).setValue(NSNumber(value: myTvShowClass.day_out!), forKey: "day_out_show")
            self.context?.object(with: myTvShowClass.id!).setValue(NSNumber(value: myTvShowClass.hour_alert!), forKey: "hour_alert_show")
            self.context?.object(with: myTvShowClass.id!).setValue(NSNumber(value: myTvShowClass.fav!), forKey: "fav_show")
        }catch{
            print("Error lors de la modification de la serie televisée")
        }
        try? self.context?.save()
    }
    
    
    func updateTvShow(myTvShow: TvShow){
        do{
            self.context?.object(with: myTvShow.objectID).setValue(myTvShow.title_show, forKey: "title_show")
            self.context?.object(with: myTvShow.objectID).setValue(myTvShow.description_show, forKey: "description_show")
            self.context?.object(with: myTvShow.objectID).setValue(myTvShow.picture_show, forKey: "picture_show")
            self.context?.object(with: myTvShow.objectID).setValue(myTvShow.frequency_out_show, forKey: "frequency_out_show")
            self.context?.object(with: myTvShow.objectID).setValue(myTvShow.day_out_show, forKey: "day_out_show")
            self.context?.object(with: myTvShow.objectID).setValue(myTvShow.hour_alert_show, forKey: "hour_alert_show")
            self.context?.object(with: myTvShow.objectID).setValue(myTvShow.fav_show, forKey: "fav_show")
        }catch{
            print("Error lors de la modification de la serie televisée")
        }
        try? self.context?.save()
    }
    
    
    
    // -----------
    // Delete
    
    func deleteTvShow(myTvShowClass: TvShowClass){
        do{
            self.context?.delete((self.context?.object(with: myTvShowClass.id!))!)
        }catch{
            print("Error lors de la suppression de la serie televisée")
        }
        try? self.context?.save()
    }
    
    
    func deleteTvShow(myTvShow: TvShow){
        do{
            self.context?.delete(myTvShow)
            
        }catch{
            print("Error lors de la suppression de la serie televisée")
        }
        try? self.context?.save()
    }
    
    
    //--------------------------------------
    //  Utils
    //--------------------------------------
    
    
    func getTvShowFromClass(myTvShowClass: TvShowClass, myTvShow: TvShow)->TvShow{
        myTvShow.title_show = myTvShowClass.title
        myTvShow.description_show = myTvShowClass.desc
        myTvShow.picture_show = myTvShowClass.picture
        myTvShow.day_out_show = myTvShowClass.day_out!
        myTvShow.frequency_out_show = myTvShowClass.frequecy_out!
        myTvShow.hour_alert_show = myTvShowClass.hour_alert!
        myTvShow.fav_show = myTvShowClass.fav!
        
        return myTvShow
    }
    
    
    func getTvShowClassFromModel(myTvShowClass: TvShowClass, myTvShow: TvShow)->TvShowClass{
        myTvShowClass.title = myTvShow.title_show
        myTvShowClass.desc = myTvShow.description_show
        myTvShowClass.picture = myTvShow.picture_show
        myTvShowClass.day_out = myTvShow.day_out_show
        myTvShowClass.frequecy_out = myTvShow.frequency_out_show
        myTvShowClass.hour_alert = myTvShow.hour_alert_show
        myTvShowClass.fav = myTvShow.fav_show
        
        return myTvShowClass
    }

}
