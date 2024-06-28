//
//  CoreDataManager.swift
//  BusBooking
//
//  Created by Fatih on 28.06.2024.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveCoreData(mail: String, fullName: String, seatNumbers: String) {
        let ticket = Ticket(context: context)
        ticket.fullName = fullName
        ticket.mail = mail
        ticket.seatsNumbers = seatNumbers
        do {
            try self.context.save()
            print(fullName, mail, seatNumbers)
        } catch {
            print("Error: \(error.localizedDescription)")
            
        }
        
    }
    
    func fetchCoreData() -> [Ticket]? {
        do {
             let fetchData = try self.context.fetch(Ticket.fetchRequest())
            return fetchData
        } catch {
            print("Error: \(error.localizedDescription)")
            
        }
        return nil
    }
    
    func deleteCoreData(index: Int) {
        
        if let dataArray =  fetchCoreData() {
            context.delete(dataArray[index])
        }
        
        do {
            try self.context.save()
        } catch {
            print("Error: \(error.localizedDescription)")
            
        }
    }
}
