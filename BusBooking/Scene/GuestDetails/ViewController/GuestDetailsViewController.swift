//
//  GuestDetailsViewController.swift
//  BusBooking
//
//  Created by Fatih on 27.06.2024.
//

import Foundation
import UIKit

class GuestDetailsViewController: UIViewController {
    
    //MARK: - Properties
    var guestDetailView = GuestDetailsView()
    var guestDetailViewModel =  GuestDetailViewModel()
    
    
    //MARK: - Lyfe Crycle
    override func loadView() {
        super.loadView()
        view = guestDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guestDetailViewModel.guestDetailViewModelDelegate = self
        setupTapGesture()
        configureNavigationBar()
    }
    
 
    func setupTapGesture() {
        let gestureMale = UITapGestureRecognizer(target: self, action: #selector(didTapMaleCheckBox))
        guestDetailView.maleCheckBoxView.addGestureRecognizer(gestureMale)
        
        let gestureFemale = UITapGestureRecognizer(target: self, action: #selector(didTapFemaleCheckBox))
        guestDetailView.femaleCheckBoxView.addGestureRecognizer(gestureFemale)
    }
    
    @objc func didTapMaleCheckBox() {
        guestDetailViewModel.setCheckedMaleCheckMark()
    }
    
    @objc func didTapFemaleCheckBox() {
        guestDetailViewModel.setCheckedFemaleCheckMark()
    }
    
    func configureNavigationBar() {
        makeOpaqueNavBar(backgroundColor: .homeRed)
        navigationController?.navigationBar.tintColor = .white
    }
    
}

//MARK: - GuestDetailViewModelDelegate
extension GuestDetailsViewController: GuestDetailViewModelDelegate {
    func changeBackgroundColorFemale(color: String) {
        guestDetailView.femaleCheckBoxView.backgroundColor = UIColor(named: color)
    }
    
    func changeBackgroundColorMale(color: String) {
        guestDetailView.maleCheckBoxView.backgroundColor = UIColor(named: color)
    }
}
