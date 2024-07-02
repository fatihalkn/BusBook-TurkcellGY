//
//  SelectSeatView.swift
//  BusBooking
//
//  Created by Fatih on 26.06.2024.
//

import Foundation
import UIKit

class SelectSeatView: UIView {
    
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
        seatsView.layer.cornerRadius = 12
        bookedleView.layer.cornerRadius = 5
        availableView.layer.cornerRadius = 5
        yourSeatView.layer.cornerRadius = 5
    }
    
    //MARK: - UI Elements
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .homeRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let seatsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let boardFromCity: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let goingFromCity: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let companyName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bookedLabel: UILabel = {
        let label = UILabel()
        label.text = "Booked".localized()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let availableLabel: UILabel = {
        let label = UILabel()
        label.text = "Available".localized()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let yourSeatLabel: UILabel = {
        let label = UILabel()
        label.text = "Your Seat".localized()
        label.textColor = .darkGray
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let yourSeatView: UIView = {
        let view = UIView()
        view.backgroundColor = .honeyYellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let availableView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bookedleView: UIView = {
        let view = UIView()
        view.backgroundColor = .homeRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    let driverSteeringImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .steeringWheel1
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let ticketInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let leftSideSeatsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let rightSideSeatsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    
}

//MARK: - SetupUI
extension SelectSeatView {
    
    func setupUI() {
      
        backgroundColor = .mainGray
        addSubview(mainView)
        addSubview(seatsView)
        addSubview(ticketInfoStackView)
        addSubview(companyName)
        seatsView.addSubview(leftSideSeatsCollectionView)
        seatsView.addSubview(rightSideSeatsCollectionView)
        seatsView.addSubview(bookedLabel)
        seatsView.addSubview(bookedleView)
        seatsView.addSubview(availableView)
        seatsView.addSubview(availableLabel)
        seatsView.addSubview(yourSeatView)
        seatsView.addSubview(yourSeatLabel)
        seatsView.addSubview(driverSteeringImageView)
        ticketInfoStackView.addArrangedSubview(boardFromCity)
        ticketInfoStackView.addArrangedSubview(arrowWapImageView)
        ticketInfoStackView.addArrangedSubview(goingFromCity)
        
        NSLayoutConstraint.activate([
            seatsView.topAnchor.constraint(equalTo: ticketInfoStackView.bottomAnchor,constant: 20),
            seatsView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            seatsView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            seatsView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            bookedleView.topAnchor.constraint(equalTo: seatsView.topAnchor, constant: 15),
            bookedleView.leadingAnchor.constraint(equalTo: seatsView.leadingAnchor, constant: 15),
            bookedleView.heightAnchor.constraint(equalToConstant: 20),
            bookedleView.widthAnchor.constraint(equalToConstant: 20),
            
            bookedLabel.topAnchor.constraint(equalTo: seatsView.topAnchor, constant: 15),
            bookedLabel.leadingAnchor.constraint(equalTo: bookedleView.trailingAnchor, constant: 10),
            
            availableView.topAnchor.constraint(equalTo: seatsView.topAnchor, constant: 15),
            availableView.leadingAnchor.constraint(equalTo: bookedLabel.trailingAnchor, constant: 15),
            availableView.heightAnchor.constraint(equalToConstant: 20),
            availableView.widthAnchor.constraint(equalToConstant: 20),
            
            availableLabel.topAnchor.constraint(equalTo: seatsView.topAnchor, constant: 15),
            availableLabel.leadingAnchor.constraint(equalTo: availableView.trailingAnchor, constant: 10),
            
            
            yourSeatView.topAnchor.constraint(equalTo: seatsView.topAnchor,constant: 15),
            yourSeatView.leadingAnchor.constraint(equalTo: availableLabel.trailingAnchor, constant: 15),
            yourSeatView.heightAnchor.constraint(equalToConstant: 20),
            yourSeatView.widthAnchor.constraint(equalToConstant: 20),
            
            
            yourSeatLabel.topAnchor.constraint(equalTo: seatsView.topAnchor, constant: 15),
            yourSeatLabel.leadingAnchor.constraint(equalTo: yourSeatView.trailingAnchor, constant: 10),
            yourSeatLabel.trailingAnchor.constraint(lessThanOrEqualTo:seatsView.trailingAnchor, constant: -30),
            
            driverSteeringImageView.topAnchor.constraint(equalTo: yourSeatLabel.bottomAnchor, constant: 20),
            driverSteeringImageView.trailingAnchor.constraint(equalTo: seatsView.trailingAnchor,constant: -15),
            driverSteeringImageView.heightAnchor.constraint(equalToConstant: 30),
            driverSteeringImageView.widthAnchor.constraint(equalToConstant: 30),
            
            
            mainView.topAnchor.constraint(equalTo: topAnchor),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            
            companyName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            companyName.leadingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            companyName.trailingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            companyName.heightAnchor.constraint(equalToConstant: 30),
            
            ticketInfoStackView.topAnchor.constraint(equalTo: companyName.bottomAnchor, constant: 20),
            ticketInfoStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            ticketInfoStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            ticketInfoStackView.heightAnchor.constraint(equalToConstant: 50),
            
            leftSideSeatsCollectionView.topAnchor.constraint(equalTo: driverSteeringImageView.bottomAnchor,constant: 25),
            leftSideSeatsCollectionView.leadingAnchor.constraint(equalTo: seatsView.leadingAnchor,constant: 20),
            leftSideSeatsCollectionView.bottomAnchor.constraint(equalTo: seatsView.bottomAnchor,constant: -20),
            leftSideSeatsCollectionView.widthAnchor.constraint(equalTo: seatsView.widthAnchor, multiplier: 0.4),
            
            rightSideSeatsCollectionView.topAnchor.constraint(equalTo: driverSteeringImageView.bottomAnchor,constant: 25),
            rightSideSeatsCollectionView.bottomAnchor.constraint(equalTo: seatsView.bottomAnchor,constant: -20),
            rightSideSeatsCollectionView.trailingAnchor.constraint(equalTo: seatsView.trailingAnchor,constant: -20),
            rightSideSeatsCollectionView.widthAnchor.constraint(equalTo: seatsView.widthAnchor, multiplier: 0.4)
            
            
        ])
    }
}
