//
//  GuestDetailsView.swift
//  BusBooking
//
//  Created by Fatih on 27.06.2024.
//

import Foundation
import UIKit

class GuestDetailsView: UIView {
    
    //MARK: - Properties
    
    
    //MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        femaleCheckBoxView.layer.cornerRadius = 15
        femaleCheckBoxView.clipsToBounds = true
        
        maleCheckBoxView.layer.cornerRadius = 15
        maleCheckBoxView.clipsToBounds = true
        
        passengerFullNameTextField.layer.cornerRadius = 10
        passengerFullNameTextField.clipsToBounds = true
        
        passengerAgeTextField.layer.cornerRadius = 10
        passengerAgeTextField.clipsToBounds = true
        
        passengerMobileTextField.layer.cornerRadius = 10
        passengerMobileTextField.clipsToBounds = true
        
        passengerEmailTextField.layer.cornerRadius = 10
        passengerEmailTextField.clipsToBounds = true
    }
    
    //MARK: - UI Elements
    
    let travellerInformationView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contactInformationView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    let travellerInformationLabel: UILabel = {
        let label = UILabel()
        label.text = "Traveller Information".localized()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let passengerLabel: UILabel = {
        let label = UILabel()
        label.text = "Passenger".localized()
        label.textColor = .black
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let passengerFullNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .mainGray
        textField.placeholder = "Full Name".localized()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passengerMobileTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .mainGray
        textField.placeholder = "Mobile".localized()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let contactInformationLabel: UILabel = {
        let label = UILabel()
        label.text = "Contact Information".localized()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let passengerEmailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .mainGray
        textField.placeholder = "Email".localized()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passengerAgeTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .mainGray
        textField.placeholder = "Age".localized()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let maleCheckBoxView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let femaleCheckBoxView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let maleLabel: UILabel = {
        let label = UILabel()
        label.text = "Male".localized()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let femaleLabel: UILabel = {
        let label = UILabel()
        label.text = "Female".localized()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let selectMaleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let selectFeMaleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let buyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .homeRed
        button.layer.cornerRadius = 10
        button.setTitle("Proceed to Book".localized(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

}

//MARK: - SetupUI
extension GuestDetailsView {
    func setupUI() {
        backgroundColor = .mainGray
        addSubview(travellerInformationView)
        addSubview(contactInformationView)
        addSubview(buyButton)
        contactInformationView.addSubview(passengerMobileTextField)
        contactInformationView.addSubview(passengerEmailTextField)
        contactInformationView.addSubview(contactInformationLabel)
        selectMaleStackView.addArrangedSubview(maleLabel)
        selectMaleStackView.addArrangedSubview(maleCheckBoxView)
        selectFeMaleStackView.addArrangedSubview(femaleLabel)
        selectFeMaleStackView.addArrangedSubview(femaleCheckBoxView)
        travellerInformationView.addSubview(travellerInformationLabel)
        travellerInformationView.addSubview(passengerLabel)
        travellerInformationView.addSubview(passengerFullNameTextField)
        travellerInformationView.addSubview(passengerAgeTextField)
        travellerInformationView.addSubview(selectMaleStackView)
        travellerInformationView.addSubview(selectFeMaleStackView)

        
        NSLayoutConstraint.activate([
            travellerInformationView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            travellerInformationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            travellerInformationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            travellerInformationView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.37),
            
            travellerInformationLabel.topAnchor.constraint(equalTo: travellerInformationView.topAnchor,constant: 15),
            travellerInformationLabel.leadingAnchor.constraint(equalTo: travellerInformationView.leadingAnchor,constant: 10),
            
            passengerLabel.topAnchor.constraint(equalTo: travellerInformationLabel.bottomAnchor, constant: 15),
            passengerLabel.leadingAnchor.constraint(equalTo: travellerInformationView.leadingAnchor,constant: 10),
            
            passengerFullNameTextField.topAnchor.constraint(equalTo: passengerLabel.bottomAnchor, constant: 10),
            passengerFullNameTextField.leadingAnchor.constraint(equalTo: travellerInformationView.leadingAnchor,constant: 10),
            passengerFullNameTextField.trailingAnchor.constraint(equalTo: travellerInformationView.trailingAnchor, constant: -10),
            passengerFullNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passengerAgeTextField.topAnchor.constraint(equalTo: passengerFullNameTextField.bottomAnchor, constant: 15),
            passengerAgeTextField.leadingAnchor.constraint(equalTo: travellerInformationView.leadingAnchor, constant: 10),
            passengerAgeTextField.trailingAnchor.constraint(equalTo: travellerInformationView.trailingAnchor, constant: -10),
            passengerAgeTextField.heightAnchor.constraint(equalToConstant: 50),
            
            selectMaleStackView.topAnchor.constraint(equalTo: passengerAgeTextField.bottomAnchor,constant: 20),
            selectMaleStackView.leadingAnchor.constraint(equalTo: travellerInformationView.leadingAnchor,constant: 40),
            selectMaleStackView.heightAnchor.constraint(equalToConstant: 30),
            
            selectFeMaleStackView.topAnchor.constraint(equalTo: passengerAgeTextField.bottomAnchor, constant: 20),
            selectFeMaleStackView.trailingAnchor.constraint(equalTo: travellerInformationView.trailingAnchor,constant: -40),
            selectFeMaleStackView.heightAnchor.constraint(equalToConstant: 30),
            
            maleCheckBoxView.heightAnchor.constraint(equalToConstant: 30),
            maleCheckBoxView.widthAnchor.constraint(equalToConstant: 30),
            
            femaleCheckBoxView.heightAnchor.constraint(equalToConstant: 30),
            femaleCheckBoxView.widthAnchor.constraint(equalToConstant: 30),
            
            contactInformationView.topAnchor.constraint(equalTo: travellerInformationView.bottomAnchor,constant: 25),
            contactInformationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contactInformationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contactInformationView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.27),
            
            contactInformationLabel.topAnchor.constraint(equalTo: contactInformationView.topAnchor,constant: 15),
            contactInformationLabel.leadingAnchor.constraint(equalTo: contactInformationView.leadingAnchor,constant: 10),
            
            passengerMobileTextField.topAnchor.constraint(equalTo: contactInformationLabel.bottomAnchor, constant: 15),
            passengerMobileTextField.leadingAnchor.constraint(equalTo: contactInformationView.leadingAnchor,constant: 10),
            passengerMobileTextField.trailingAnchor.constraint(equalTo: contactInformationView.trailingAnchor,constant: -10),
            passengerMobileTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passengerEmailTextField.topAnchor.constraint(equalTo: passengerMobileTextField.bottomAnchor, constant: 15),
            passengerEmailTextField.leadingAnchor.constraint(equalTo: contactInformationView.leadingAnchor,constant: 10),
            passengerEmailTextField.trailingAnchor.constraint(equalTo: contactInformationView.trailingAnchor,constant: -10),
            passengerEmailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            buyButton.topAnchor.constraint(equalTo: contactInformationView.bottomAnchor, constant: 30),
            buyButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 10),
            buyButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            buyButton.heightAnchor.constraint(equalToConstant: 50)
            
            
            

            
            
            
        ])
    }
}
