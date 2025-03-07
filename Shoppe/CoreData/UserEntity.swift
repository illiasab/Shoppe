//
//  UserEntity.swift
//  Shoppe
//
//  Created by Андрей Завадский on 07.03.2025.
//

import Foundation
import CoreData

@objc(UserEntity)
public class UserEntity: NSManagedObject {
}


extension UserEntity {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var id: Int16
    @NSManaged public var username: String?
    @NSManaged public var password: String?
}

extension UserEntity: Identifiable { }
