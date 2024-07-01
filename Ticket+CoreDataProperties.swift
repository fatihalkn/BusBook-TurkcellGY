//
//  Ticket+CoreDataProperties.swift
//  BusBooking
//
//  Created by Fatih on 1.07.2024.
//
//

import Foundation
import CoreData


extension Ticket {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ticket> {
        return NSFetchRequest<Ticket>(entityName: "Ticket")
    }

    @NSManaged public var id: String?
    @NSManaged public var fullName: String?
    @NSManaged public var mail: String?
    @NSManaged public var seatsNumbers: NSObject?

}

extension Ticket : Identifiable {

}
