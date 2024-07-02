//
//  Localized.swift
//  BusBooking
//
//  Created by Fatih on 2.07.2024.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}
