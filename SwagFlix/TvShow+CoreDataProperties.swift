//
//  TvShow+CoreDataProperties.swift
//  SwagFlix
//
//  Created by Akiro on 29/09/2016.
//  Copyright © 2016 Manouanachristopher. All rights reserved.
//

import Foundation
import CoreData


extension TvShow {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TvShow> {
        return NSFetchRequest<TvShow>(entityName: "TvShow");
    }

    @NSManaged public var description_show: String?
    @NSManaged public var title_show: String?
    @NSManaged public var picture_show: String?
    @NSManaged public var fav: Int32
    @NSManaged public var frequency_out_show: Int32
    @NSManaged public var day_out_show: Int32
    @NSManaged public var hour_alert: Int32

}
