//
//  RightSideCollectionCell.swift
//  BusBooking
//
//  Created by Fatih on 26.06.2024.
//

import UIKit

class RightSideCollectionCell: UICollectionViewCell {
    static let identifier = "RightSideCollectionCell"
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rightSeatsView.layer.cornerRadius = 10
    }
    
    let rightSeatsView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
}

//MARK: - SetuPUI
extension RightSideCollectionCell {
    
    func setupUI() {
        addSubview(rightSeatsView)
        
        NSLayoutConstraint.activate([
            rightSeatsView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            rightSeatsView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            rightSeatsView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            rightSeatsView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}
