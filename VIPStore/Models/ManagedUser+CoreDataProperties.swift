//
//  ManagedUser+CoreDataProperties.swift
//  VIPStore
//
//  Created by Guntur Budi on 03/08/21.
//

import Foundation
import CoreData


extension ManagedUsers
{
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedUsers>
    {
        return NSFetchRequest<ManagedUsers>(entityName: "ManagedUser")
    }

    @NSManaged public var id: String?
    @NSManaged public var username: String?
    @NSManaged public var password: String?
    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?
    @NSManaged public var email: String?
}
