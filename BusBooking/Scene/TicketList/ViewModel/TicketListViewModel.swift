//
//  TicketListViewModel.swift
//  BusBooking
//
//  Created by Fatih on 25.06.2024.
//

import Foundation

class TicketListViewModel {
    
    
    var ankaraToAntalyaTickets: [TicketListModel] = [
        .init(boardFromCity: "Ankara", goingFromCity: "Antalya", companyName: "Kamil Koç Turizim"),
        .init(boardFromCity: "Ankara", goingFromCity: "Antalya", companyName: "Metro Turizim"),
        .init(boardFromCity: "Ankara", goingFromCity: "Antalya", companyName: "Isparta Petrol Turizim"),
        .init(boardFromCity: "Ankara", goingFromCity: "Antalya", companyName: "Pamukkale Turizim")]
}
