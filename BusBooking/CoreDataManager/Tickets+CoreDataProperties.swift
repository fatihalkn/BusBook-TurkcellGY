//
//  Tickets+CoreDataProperties.swift
//  BusBooking
//
//  Created by Fatih on 28.06.2024.
//
//

import Foundation
import CoreData


extension Ticket {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ticket> {
        return NSFetchRequest<Ticket>(entityName: "Ticket")
    }

    @NSManaged public var id: Int64
    @NSManaged public var fullName: String?
    @NSManaged public var mail: String?
    @NSManaged public var seatsNumbers: String?

}

extension Ticket : Identifiable {

}
