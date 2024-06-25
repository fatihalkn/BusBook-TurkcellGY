//
//  TicketListController.swift
//  BusBooking
//
//  Created by Fatih on 25.06.2024.
//

import Foundation
import UIKit


class TicketListController: UIViewController {
    
    //MARK: - Properties
    let ticketListView = TicketListView()
    let ticketListViewModel = TicketListViewModel()
    
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        view = ticketListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRegister()
        setupDelegate()
    }
    
    func setupRegister() {
        ticketListView.ticketListCollectionView.register(TicketsCollectionViewCell.self, forCellWithReuseIdentifier: TicketsCollectionViewCell.identifier)
    }
    
    func setupDelegate() {
        ticketListView.ticketListCollectionView.dataSource = self
        ticketListView.ticketListCollectionView.delegate = self
    }
    
    
}

extension TicketListController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if ticketListView.boardFromCityLabel.text == "Ankara" && ticketListView.goingCityLabel.text == "Antalya" {
            return ticketListViewModel.ankaraToAntalyaTickets.count
        }
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TicketsCollectionViewCell.identifier, for: indexPath) as! TicketsCollectionViewCell
        let data = ticketListViewModel.ankaraToAntalyaTickets[indexPath.row]
        cell.configureTickets(data: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWitdh: CGFloat = (collectionView.frame.width - 30)
        let cellHeight: CGFloat = (collectionView.frame.height) / 4
        return .init(width: cellWitdh, height: cellHeight)
    }
}
