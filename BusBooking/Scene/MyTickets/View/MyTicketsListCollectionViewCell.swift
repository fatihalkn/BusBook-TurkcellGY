//
//  MyTicketsListCollectionViewCell.swift
//  BusBooking
//
//  Created by Fatih on 1.07.2024.
//

import UIKit

class MyTicketsListCollectionViewCell: UICollectionViewCell {
    static let identifier = "MyTicketsListCollectionViewCell"
    
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
    
    let fullName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.text = "Name: ".localized()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mail: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mailAdress: UILabel = {
        let label = UILabel()
        label.text = "Mail: ".localized()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let seatNumbers: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let seats: UILabel = {
        let label = UILabel()
        label.text = "Seat Number: ".localized()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configure(data: Ticket) {
        fullName.text = data.fullName
        mail.text = data.mail
        let seatNumbersString = (data.seatsNumbers as? [Int] ?? []).map{"\($0)" }.joined(separator: ", ")
        self.seatNumbers.text = seatNumbersString
    }
}


extension MyTicketsListCollectionViewCell {
    func setupUI() {
        backgroundColor = .white
        addSubview(fullName)
        addSubview(mail)
        addSubview(seatNumbers)
        addSubview(name)
        addSubview(mailAdress)
        addSubview(seats)
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 10),
            name.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            
            mailAdress.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20),
            mailAdress.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            seats.topAnchor.constraint(equalTo: mailAdress.bottomAnchor, constant: 20),
            seats.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            
            fullName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            fullName.leadingAnchor.constraint(equalTo: name.trailingAnchor, constant: 15),
            fullName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            mail.topAnchor.constraint(equalTo: fullName.bottomAnchor, constant: 20),
            mail.leadingAnchor.constraint(equalTo: mailAdress.trailingAnchor,constant: 15),
            mail.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            seatNumbers.topAnchor.constraint(equalTo: mailAdress.bottomAnchor, constant: 20),
            seatNumbers.leadingAnchor.constraint(equalTo: seats.trailingAnchor,constant: 15),
            seatNumbers.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)
            
        ])
    }
}
