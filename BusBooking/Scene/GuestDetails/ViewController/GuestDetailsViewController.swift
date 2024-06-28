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
    var coreDataManager = CoreDataManager()
    
    
    
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
        
        guestDetailView.buyButton.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
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
    
    @objc func buyButtonTapped() {
        print("buyButtonTapped called")
        let seatNumbers = guestDetailViewModel.seatsNumbers.map { $0.number }.joined(separator: ", ")
        guard let mail = guestDetailView.passengerEmailTextField.text else { return }
        guard let fullName = guestDetailView.passengerFullNameTextField.text else { return }
        coreDataManager.saveCoreData(mail: mail, fullName: fullName, seatNumbers: seatNumbers)
        let vc = MyTicketsViewController()
        navigationController?.pushViewController(vc, animated: true)
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
