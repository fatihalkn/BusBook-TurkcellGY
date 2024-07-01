//
//  MyTicketsView.swift
//  BusBooking
//
//  Created by Fatih on 1.07.2024.
//

import Foundation
import UIKit

class MyTicketsView: UIView {
    
    //MARK: - Properties
    
    
    //MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - UIElements
    
    let myTicketListCollectionView: UICollectionView = {
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

extension MyTicketsView {
    func setupUI() {
        backgroundColor = .mainGray
        addSubview(myTicketListCollectionView)
        
        NSLayoutConstraint.activate([
            myTicketListCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 20),
            myTicketListCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            myTicketListCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            myTicketListCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
