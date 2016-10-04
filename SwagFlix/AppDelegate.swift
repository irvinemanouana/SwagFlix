//
//  AppDelegate.swift
//  SwagFlix
//
//  Created by Manouana on 28/09/2016.
//  Copyright © 2016 Manouanachristopher. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var context: NSManagedObjectContext?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let modelUrl = Bundle.main.url(forResource:"SwagFlix", withExtension:"momd")
        let modelSchema = NSManagedObjectModel(contentsOf: modelUrl!)
        let storeCoordinate = NSPersistentStoreCoordinator(managedObjectModel: modelSchema!)
        let documentUrl = FileManager.default.urls(for: .documentDirectory, in:.userDomainMask).first!
        let dbURL = documentUrl.appendingPathComponent("SwagFlix.db")
        
        
        print("modeUrl : \(modelUrl)")
        print("modeSchema : \(modelSchema)")
        
        do{
            try storeCoordinate.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: dbURL, options: nil)
            
            let objectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
            objectContext.persistentStoreCoordinator = storeCoordinate
            self.context = objectContext
            
        }catch{
            print("?")
        }

        addTvShow()
        getTvShow()
        
        return true
    }
    
    func addTvShow(){
        let tvShow = NSEntityDescription.insertNewObject(forEntityName: "TvShow", into: self.context!) as! TvShow
        
        tvShow.title_show = "Professeur SWAG"
        tvShow.description_show = "Les extraordinaires aventures de Pr SWAG"
        tvShow.picture_show = "PrSWAG.png"
        tvShow.frequency_out_show = 1
        tvShow.day_out_show = 1
        tvShow.hour_alert = 1
        tvShow.fav = 1
        
        
        try? self.context?.save()
        
    }
    
    func deleteTvShow(){
        
    }
    
    func editTvShow(){
        
    }
    
    func getTvShow(){
        /*
         let request = NSFetchRequest<Person>(entityName: "Person")
         let storeResult = try? self.context?.execute(request) as! NSAsynchronousFetchResult<Person>
         for p in (storeResult?.finalResult)! {
         print("\(p.firstname) \(p.lastname)")
         }
         */
        
        /*
         let request = NSFetchRequest<Person>(entityName: "Person")
         let persons = try? self.context?.fetch(request)
         for p in persons!!{
         print("\(p.firstname) \(p.lastname)")
         }
         */
        
        let request = NSFetchRequest<TvShow>(entityName: "TvShow")
        let shows = try? (self.context?.fetch(request))!
        for show in shows!{
            print("myShow"+"\(show.title_show) \(show.description_show)")
        }
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "SwagFlix")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

