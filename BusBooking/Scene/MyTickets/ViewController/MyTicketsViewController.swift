//
//  MyTicketsViewController.swift
//  BusBooking
//
//  Created by Fatih on 28.06.2024.
//

import Foundation
import UIKit

class MyTicketsViewController: UIViewController {
    
    
    let myTicketViewModel = MyTicketsViewModel()
    let myTicketView = MyTicketsView()
    
    override func loadView() {
        super.loadView()
        view = myTicketView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupRegister()
        myTicketViewModel.fetchTickets()
        title = "Biletlerim"
    }
    
    func setupRegister() {
        myTicketView.myTicketListCollectionView.register(MyTicketsListCollectionViewCell.self, forCellWithReuseIdentifier: MyTicketsListCollectionViewCell.identifier)
    }
    
    func setupDelegate() {
        myTicketView.myTicketListCollectionView.delegate = self
        myTicketView.myTicketListCollectionView.dataSource = self
    }
}

//MARK: - Configure CollectionView
extension MyTicketsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myTicketViewModel.savedTickets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyTicketsListCollectionViewCell.identifier, for: indexPath) as! MyTicketsListCollectionViewCell
        let data = myTicketViewModel.savedTickets[indexPath.item]
        cell.configure(data: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWitdh: CGFloat = (collectionView.frame.width - 30)
        let cellHeight: CGFloat = (collectionView.frame.height) / 5
        return .init(width: cellWitdh, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        myTicketViewModel.deleteTickets(index: index)
        collectionView.deselectItem(at: indexPath, animated: true)
        myTicketView.myTicketListCollectionView.reloadData()
    }
}
