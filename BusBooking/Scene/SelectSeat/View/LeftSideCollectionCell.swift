//
//  LeftSideCollectionCell.swift
//  BusBooking
//
//  Created by Fatih on 26.06.2024.
//

import UIKit

class LeftSideCollectionCell: UICollectionViewCell {
    static let identifier = "LeftSideCollectionCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        leftSeatsView.layer.cornerRadius = 10
    }
    
    let seatsView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainGray
        return view
    }()
    
    let leftSeatsView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}

//MARK: - SetuPUI
extension LeftSideCollectionCell {
    
    func setupUI() {
        addSubview(leftSeatsView)
        
        NSLayoutConstraint.activate([
            leftSeatsView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            leftSeatsView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            leftSeatsView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            leftSeatsView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}
