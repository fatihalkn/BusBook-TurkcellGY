//
//  SelectSeatViewModel.swift
//  BusBooking
//
//  Created by Fatih on 26.06.2024.
//

import Foundation

class SelectSeatViewModel {
    
    var leftSeatNumbers: [SelectSeatsModel] = [.init(number: "1"),
                                               .init(number: "2"),
                                               .init(number: "3"),
                                               .init(number: "4"),
                                               .init(number: "5"),
                                               .init(number: "6"),
                                               .init(number: "7"),
                                               .init(number: "8"),
                                               .init(number: "9"),
                                               .init(number: "10"),
                                               .init(number: "11"),
                                               .init(number: "12")]
    
    
    var rightSeatNumbers: [SelectSeatsModel] = [.init(number: "13"),
                                                .init(number: "14"),
                                                .init(number: "15"),
                                                .init(number: "16"),
                                                .init(number: "17"),
                                                .init(number: "18"),
                                                .init(number: "19"),
                                                .init(number: "20"),
                                                .init(number: "21"),
                                                .init(number: "22"),
                                                .init(number: "23"),
                                                .init(number: "24")]
    
    
    var reservedRightSeats: [SelectSeatsModel] = [
        .init(number: "16"),
        .init(number: "22"),
        .init(number: "14")
    ]
    var reservedLeftSeats: [SelectSeatsModel] = [
        .init(number: "9"),
        .init(number: "6"),
        .init(number: "1")
    ]
    
    var selectedRightSeats: [SelectSeatsModel] = [

    ]
    var selectedLeftSeats: [SelectSeatsModel] = [

    ]
}
