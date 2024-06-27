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
        homeViewModel.viewDelegate = self
        
        homeView.boardingCitiesPickerView.delegate = self
        homeView.boardingCitiesPickerView.dataSource = self
        
        homeView.whereAreButtonCitiesPickerView.delegate = self
        homeView.whereAreButtonCitiesPickerView.dataSource = self
        
        
    }
    
    func addActions() {
        homeView.boardingFromButton.addTarget(self, action: #selector(boardingFromButtonTapped), for: .touchUpInside)
        homeView.whereAreYouGoingButton.addTarget(self, action: #selector(whereAreYouGoingButtonTapped), for: .touchUpInside)
        homeView.todayButton.addTarget(self, action: #selector(todayButtonTapped), for: .touchUpInside)
        homeView.tomorrowButton.addTarget(self, action: #selector(tomorrowButtonTapped), for: .touchUpInside)
        
        homeView.findBusButton.addTarget(self, action: #selector(findBusButtonTapped), for: .touchUpInside)
        
        
    }
    
    @objc func findBusButtonTapped() {
        homeViewModel.findsButtonTapped()
    }
    
    @objc func boardingFromButtonTapped() {
        homeView.hiddenTextFieldBoardingButton.becomeFirstResponder()
    }
    
    @objc func whereAreYouGoingButtonTapped() {
        homeView.hiddenTextFieldWhereAreButton.becomeFirstResponder()
    }
    
    @objc func todayButtonTapped() {
        homeView.datePicker.setDate(Date(), animated: true)
    }
    
    @objc func tomorrowButtonTapped() {
        let today = Date()
        if let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today) {
            homeView.datePicker.setDate(tomorrow, animated: true)
        }
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
            let selectCity = homeViewModel.cities[row]
            homeView.boardingFromButton.setTitle(selectCity, for: .normal)
            homeViewModel.fromCityName = selectCity
        case homeView.whereAreButtonCitiesPickerView:
            let selectCity = homeViewModel.cities[row]
            homeView.whereAreYouGoingButton.setTitle(selectCity, for: .normal)
            homeViewModel.goingCityName = selectCity
        default: break
            
        }
        
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func showError(text: String) {
        homeView.showError(text: text, image: nil, interaction: false, delay: nil)
    }
    
    func openTicketListController(boardingFromCity: String, goingFromCity: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let date = dateFormatter.string(from: homeView.datePicker.date)
        let vc = TicketListController()
        vc.ticketListView.boardFromCityLabel.text = boardingFromCity
        vc.ticketListView.goingCityLabel.text = goingFromCity
        vc.ticketListView.calendarLabel.text = date
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
