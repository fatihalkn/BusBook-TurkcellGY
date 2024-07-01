//
//  MyTicketsViewModel.swift
//  BusBooking
//
//  Created by Fatih on 28.06.2024.
//

import Foundation

class MyTicketsViewModel {
    
    var savedTickets: [Ticket] = []
    
    func saveTickets(mail: String, fullName: String, seatNumbers: [Int32]) {
        CoreDataManager.shared.saveCoreData(mail: mail, fullName: fullName, seatNumbers: seatNumbers)
    }
    
    func fetchTickets() {
        guard let tickets = CoreDataManager.shared.fetchCoreData() else { return }
        savedTickets = tickets
    }
    
    func deleteTickets(index: Int) {
        CoreDataManager.shared.deleteCoreData(index: index)
        savedTickets.remove(at: index)
    }
}
