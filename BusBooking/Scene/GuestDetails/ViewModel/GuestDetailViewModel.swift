//
//  GuestDetailViewModel.swift
//  BusBooking
//
//  Created by Fatih on 27.06.2024.
//

import Foundation

protocol GuestDetailViewModelDelegate {
    func changeBackgroundColorFemale(color: String)
    func changeBackgroundColorMale(color: String)
}

class GuestDetailViewModel {
    
    var seatsNumbers: [SelectSeatsModel] = []
    var isMaleChecked = false
    var isFemaleChecked = false
    var guestDetailViewModelDelegate: GuestDetailViewModelDelegate?
    
   
    
    func setCheckedMaleCheckMark() {
        self.isMaleChecked = !isMaleChecked
        if self.isMaleChecked {
            guestDetailViewModelDelegate?.changeBackgroundColorMale(color: "homeRed")
            guestDetailViewModelDelegate?.changeBackgroundColorFemale(color: "mainGray")
            self.isFemaleChecked = false
        } else {
            guestDetailViewModelDelegate?.changeBackgroundColorMale(color: "homeRed")
        }
    }
    
    
    func setCheckedFemaleCheckMark() {
        self.isFemaleChecked = !isFemaleChecked
        if self.isFemaleChecked {
            guestDetailViewModelDelegate?.changeBackgroundColorFemale(color: "homeRed")
            guestDetailViewModelDelegate?.changeBackgroundColorMale(color: "mainGray")
            self.isMaleChecked = false
        } else {
            guestDetailViewModelDelegate?.changeBackgroundColorFemale(color: "mainGray")
        }
    }
}
