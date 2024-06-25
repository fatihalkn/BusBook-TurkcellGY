//
//  TicketListView.swift
//  BusBooking
//
//  Created by Fatih on 24.06.2024.
//

import Foundation
import UIKit

class TicketListView: UIView {
    
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
    }
    
    //MARK: - UI Elements
    
    let ticketListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .homeRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let selectYourBusLabel: UILabel = {
        let label = UILabel()
        label.text = "Select your bus!"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let boardFromCityLabel: UILabel = {
        let label = UILabel()
        label.text = "Ankara"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let goingCityLabel: UILabel = {
        let label = UILabel()
        label.text = "Antalya"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let calendarLabel: UILabel = {
        let label = UILabel()
        label.text = "12-12-12"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let greenBusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .onboardingBus
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let arrowWapImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .arrowswapvertical
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let rotaStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
  
}

//MARK: - SetupUI
extension TicketListView {
    
    func setupUI() {
        backgroundColor = .mainGray
        addSubview(mainView)
        addSubview(ticketListCollectionView)
        mainView.addSubview(selectYourBusLabel)
        mainView.addSubview(rotaStackView)
        mainView.addSubview(calendarLabel)
        mainView.addSubview(greenBusImageView)
        rotaStackView.addArrangedSubview(boardFromCityLabel)
        rotaStackView.addArrangedSubview(arrowWapImageView)
        rotaStackView.addArrangedSubview(goingCityLabel)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: self.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
            
            selectYourBusLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            selectYourBusLabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor,constant: -50),
            selectYourBusLabel.heightAnchor.constraint(equalToConstant: 50),
            selectYourBusLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
            
            rotaStackView.topAnchor.constraint(equalTo: selectYourBusLabel.topAnchor,constant: 50),
            rotaStackView.leadingAnchor.constraint(equalTo:mainView.leadingAnchor,constant: 10),
            rotaStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -10),
            rotaStackView.heightAnchor.constraint(equalToConstant: 50),
            
            calendarLabel.bottomAnchor.constraint(equalTo: rotaStackView.bottomAnchor, constant: 30),
            calendarLabel.leadingAnchor.constraint(equalTo:mainView.leadingAnchor,constant: 100),
            calendarLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -100),
            calendarLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 60),
            
            greenBusImageView.centerXAnchor.constraint(equalTo: calendarLabel.centerXAnchor),
            greenBusImageView.bottomAnchor.constraint(equalTo: ticketListCollectionView.topAnchor),
            greenBusImageView.heightAnchor.constraint(equalToConstant: 70),
            greenBusImageView.widthAnchor.constraint(equalToConstant: 100),
            
            ticketListCollectionView.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -50),
            ticketListCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            ticketListCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            ticketListCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}
