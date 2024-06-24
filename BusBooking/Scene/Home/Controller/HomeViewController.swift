//
//  HomeViewController.swift
//  BusBooking
//
//  Created by Fatih on 24.06.2024.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Properties
    let homeView = HomeView()
    let homeViewModel = HomeViewModel()
    
    override func loadView() {
        super.loadView()
        view = homeView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        addActions()
    }
    
    func setupDelegate() {
        homeView.boardingCitiesPickerView.delegate = self
        homeView.boardingCitiesPickerView.dataSource = self
        
        homeView.whereAreButtonCitiesPickerView.delegate = self
        homeView.whereAreButtonCitiesPickerView.dataSource = self
    }
    
    func addActions() {
        homeView.boardingFromButton.addTarget(self, action: #selector(boardingFromButtonTapped), for: .touchUpInside)
        homeView.whereAreYouGoingButton.addTarget(self, action: #selector(whereAreYouGoingButtonTapped), for: .touchUpInside)
        
      
        
    }
    
    @objc func boardingFromButtonTapped() {
        homeView.hiddenTextFieldBoardingButton.becomeFirstResponder()
    }
    
    @objc func whereAreYouGoingButtonTapped() {
        homeView.hiddenTextFieldWhereAreButton.becomeFirstResponder()
    }
    
    
   
}

//MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension HomeViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        switch pickerView {
        case homeView.boardingCitiesPickerView:
            return 1
        case homeView.whereAreButtonCitiesPickerView:
            return 1
        default: break
            
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case homeView.boardingCitiesPickerView:
            return homeViewModel.cities.count
        case homeView.whereAreButtonCitiesPickerView:
            return homeViewModel.cities.count
        default: break
            
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case homeView.boardingCitiesPickerView:
            return homeViewModel.cities[row]
        case homeView.whereAreButtonCitiesPickerView:
            return homeViewModel.cities[row]
        default: break
            
        }
        
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case homeView.boardingCitiesPickerView:
            homeView.boardingFromButton.setTitle(homeViewModel.cities[row], for: .normal)
        case homeView.whereAreButtonCitiesPickerView:
            homeView.whereAreYouGoingButton.setTitle(homeViewModel.cities[row], for: .normal)
        default: break
            
        }
       
    }
}

