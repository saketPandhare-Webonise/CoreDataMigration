//
//  UserInfo+CoreDataProperties.swift
//  CDMigration
//
//  Created by Saket.Webonise Pandhare on 26/02/18.
//  Copyright © 2018 Saket.Webonise. All rights reserved.
//
//

import Foundation
import CoreData


extension UserInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserInfo> {
        return NSFetchRequest<UserInfo>(entityName: "UserInfo")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var middleName: String?
    @NSManaged public var mobileNo: Double

}
