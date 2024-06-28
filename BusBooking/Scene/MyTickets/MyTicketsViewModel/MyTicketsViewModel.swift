//
//  MyTicketsViewModel.swift
//  BusBooking
//
//  Created by Fatih on 28.06.2024.
//

import Foundation

class MyTicketsViewModel {
    
    var savedTickets: [Ticket] = []
    let coreDataManager = CoreDataManager()
    
    func saveTickets(mail: String, fullName: String, seatNumbers: String) {
        coreDataManager.saveCoreData(mail: mail, fullName: fullName, seatNumbers: seatNumbers)
    }
    
    func fetchTickets() {
        guard let ticket = coreDataManager.fetchCoreData() else { return }
        savedTickets = ticket
    }
    
    func deleteTickets(index: Int) {
        coreDataManager.deleteCoreData(index: index)
    }
}
