//
//  TicketsCollectionViewCell.swift
//  BusBooking
//
//  Created by Fatih on 25.06.2024.
//

import UIKit

class TicketsCollectionViewCell: UICollectionViewCell {
    static let identifier = "TicketsCollectionViewCell"
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 10
    }
    
    let boardFromCity: UILabel = {
        let label = UILabel()
        label.text = "Ankara"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let goingFromCity: UILabel = {
        let label = UILabel()
        label.text = "Antalya"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let companyName: UILabel = {
        let label = UILabel()
        label.text = "Kamil Koç"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let arrowWapImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .arrowswapvertical
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = .homeRed
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
    
    func configureTickets(data: TicketListModel) {
        boardFromCity.text = data.boardFromCity
        goingFromCity.text = data.goingFromCity
        companyName.text = data.companyName
    }
  
}

//MARK: - SetupUI
extension TicketsCollectionViewCell {
    
    func setupUI() {
      
        backgroundColor = .white
        addSubview(ticketInfoStackView)
        addSubview(companyName)
        ticketInfoStackView.addArrangedSubview(boardFromCity)
        ticketInfoStackView.addArrangedSubview(arrowWapImageView)
        ticketInfoStackView.addArrangedSubview(goingFromCity)
        
        NSLayoutConstraint.activate([
            companyName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            companyName.leadingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            companyName.trailingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            companyName.heightAnchor.constraint(equalToConstant: 30),
            
            ticketInfoStackView.topAnchor.constraint(equalTo: companyName.bottomAnchor, constant: 10),
            ticketInfoStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            ticketInfoStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            ticketInfoStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
