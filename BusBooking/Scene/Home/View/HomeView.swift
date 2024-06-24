//
//  HomeView.swift
//  BusBooking
//
//  Created by Fatih on 24.06.2024.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    //MARK: - Properties
    let pickerToolBar = UIToolbar()
    
    //MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //MARK: - UI Elements
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .homeRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rotaSelectionContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .honeyYellow
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let busImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .homeBus
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let todayButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.setTitle("Today", for: .normal)
        button.titleLabel?.textColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let tomorrowButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.setTitle("Tomorrow", for: .normal)
        button.titleLabel?.textColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let otherButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.setTitle("🗓️", for: .normal)
        button.titleLabel?.textColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let findBusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .homeRed
        button.layer.cornerRadius = 8
        button.setTitle("Find Buses", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let boardingFromButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.setTitle("Boarding From", for: .normal)
        button.setTitleColor(.textPruple, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return button
    }()
    
    let whereAreYouGoingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.setTitle("Where are you going?", for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        button.setTitleColor(.textPruple, for: .normal)
        return button
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hey Fatih!"
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let whereYouWantLabel: UILabel = {
        let label = UILabel()
        label.text = "Where you want go."
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let daysButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let boardingCitiesPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    
    let whereAreButtonCitiesPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    
    let hiddenTextFieldBoardingButton: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isHidden = true
        return textField
    }()
    
    let hiddenTextFieldWhereAreButton: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isHidden = true
        return textField
    }()
    
    
    
    @objc func doneButtonTapped() {
        hiddenTextFieldBoardingButton.resignFirstResponder()
        hiddenTextFieldWhereAreButton.resignFirstResponder()
    }
    
}

//MARK: - SetupUI
extension HomeView {
    
    func setupUI() {
        pickerToolBar.sizeToFit()
        pickerToolBar.barStyle = .default
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        pickerToolBar.setItems([doneButton], animated: false)
        hiddenTextFieldBoardingButton.inputAccessoryView = pickerToolBar
        hiddenTextFieldWhereAreButton.inputAccessoryView = pickerToolBar
        hiddenTextFieldBoardingButton.inputView = boardingCitiesPickerView
        hiddenTextFieldWhereAreButton.inputView = whereAreButtonCitiesPickerView
        addSubview(mainView)
        addSubview(rotaSelectionContentView)
        addSubview(hiddenTextFieldBoardingButton)
        addSubview(hiddenTextFieldWhereAreButton)
        mainView.addSubview(busImageView)
        mainView.addSubview(nameLabel)
        mainView.addSubview(whereYouWantLabel)
        daysButtonStackView.addArrangedSubview(todayButton)
        daysButtonStackView.addArrangedSubview(tomorrowButton)
        daysButtonStackView.addArrangedSubview(otherButton)
        rotaSelectionContentView.addSubview(findBusButton)
        rotaSelectionContentView.addSubview(boardingFromButton)
        rotaSelectionContentView.addSubview(whereAreYouGoingButton)
        rotaSelectionContentView.addSubview(daysButtonStackView)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            
            busImageView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            busImageView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor,constant: 50),
            busImageView.heightAnchor.constraint(equalToConstant: 100),
            busImageView.widthAnchor.constraint(equalToConstant: 100),
            
            nameLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor,constant: -50),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
            
            whereYouWantLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            whereYouWantLabel.bottomAnchor.constraint(equalTo: busImageView.topAnchor),
            whereYouWantLabel.leadingAnchor.constraint(lessThanOrEqualTo: mainView.leadingAnchor,constant: 30),
            whereYouWantLabel.trailingAnchor.constraint(greaterThanOrEqualTo: mainView.trailingAnchor, constant: -30),
            
            
            rotaSelectionContentView.topAnchor.constraint(equalTo: busImageView.bottomAnchor,constant: 5),
            rotaSelectionContentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 30),
            rotaSelectionContentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            rotaSelectionContentView.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            boardingFromButton.topAnchor.constraint(equalTo: rotaSelectionContentView.topAnchor,constant: 25),
            boardingFromButton.leadingAnchor.constraint(equalTo: rotaSelectionContentView.leadingAnchor,constant: 15),
            boardingFromButton.trailingAnchor.constraint(equalTo: rotaSelectionContentView.trailingAnchor, constant: -15),
            boardingFromButton.heightAnchor.constraint(equalToConstant: 60),
            
            hiddenTextFieldBoardingButton.topAnchor.constraint(equalTo: rotaSelectionContentView.topAnchor,constant: 25),
            hiddenTextFieldBoardingButton.leadingAnchor.constraint(equalTo: rotaSelectionContentView.leadingAnchor,constant: 15),
            hiddenTextFieldBoardingButton.trailingAnchor.constraint(equalTo: rotaSelectionContentView.trailingAnchor, constant: -15),
            hiddenTextFieldBoardingButton.heightAnchor.constraint(equalToConstant: 60),
            
            whereAreYouGoingButton.topAnchor.constraint(equalTo: boardingFromButton.bottomAnchor, constant: 10),
            whereAreYouGoingButton.leadingAnchor.constraint(equalTo: rotaSelectionContentView.leadingAnchor,constant: 15),
            whereAreYouGoingButton.trailingAnchor.constraint(equalTo: rotaSelectionContentView.trailingAnchor, constant: -15),
            whereAreYouGoingButton.heightAnchor.constraint(equalToConstant: 60),
            
            hiddenTextFieldWhereAreButton.topAnchor.constraint(equalTo: boardingFromButton.bottomAnchor, constant: 10),
            hiddenTextFieldWhereAreButton.leadingAnchor.constraint(equalTo: rotaSelectionContentView.leadingAnchor,constant: 15),
            hiddenTextFieldWhereAreButton.trailingAnchor.constraint(equalTo: rotaSelectionContentView.trailingAnchor, constant: -15),
            hiddenTextFieldWhereAreButton.heightAnchor.constraint(equalToConstant: 60),
            
            
            
            daysButtonStackView.topAnchor.constraint(equalTo: whereAreYouGoingButton.bottomAnchor, constant: 10),
            daysButtonStackView.leadingAnchor.constraint(equalTo: rotaSelectionContentView.leadingAnchor, constant: 15),
            daysButtonStackView.trailingAnchor.constraint(equalTo: rotaSelectionContentView.trailingAnchor, constant: -15),
            
            findBusButton.topAnchor.constraint(equalTo: daysButtonStackView.bottomAnchor, constant: 20),
            findBusButton.leadingAnchor.constraint(equalTo: rotaSelectionContentView.leadingAnchor,constant: 15),
            findBusButton.trailingAnchor.constraint(equalTo: rotaSelectionContentView.trailingAnchor, constant: -15),
            findBusButton.heightAnchor.constraint(equalToConstant: 60),
            findBusButton.bottomAnchor.constraint(equalTo: rotaSelectionContentView.bottomAnchor, constant: -10),
        ])
    }
}
