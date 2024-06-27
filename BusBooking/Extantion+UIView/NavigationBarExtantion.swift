//
//  NavigationBarExtantion.swift
//  BusBooking
//
//  Created by Fatih on 27.06.2024.
//

import Foundation

import UIKit.UIViewController

extension UIViewController {
    
 func makeOpaqueNavBar(backgroundColor: UIColor? = nil) {
 let appearance = UINavigationBarAppearance()
 appearance.configureWithOpaqueBackground()
 appearance.backgroundColor = backgroundColor
 appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
 appearance.shadowColor = .black.withAlphaComponent(0.2)
 navigationController?.navigationBar.standardAppearance = appearance
 navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
     
 }
 
 
 func makeTransclucentNavBar() {
 let appearance = UINavigationBarAppearance()
 appearance.configureWithTransparentBackground()
 appearance.backgroundColor = .clear
 appearance.shadowColor = .clear
 navigationController?.navigationBar.standardAppearance = appearance
 navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
 navigationController?.isNavigationBarHidden = false
     
 }
    
}
