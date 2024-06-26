//
//  SelectSeatViewController.swift
//  BusBooking
//
//  Created by Fatih on 26.06.2024.
//

import Foundation
import UIKit

class SelectSeatViewController: UIViewController {
    
    
    //MARK: - Properties
    var selectSeatView = SelectSeatView()
    var selectSeatViewModel = SelectSeatViewModel()
    var selectSeatCount = 0
    var maxSelectSeatCount = 5
    
    
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        view = selectSeatView
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupRegister()
        selectSeatView.rightSideSeatsCollectionView.reloadData()
        selectSeatView.leftSideSeatsCollectionView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        defaultSelectedSeats()
    }
    
    func setupRegister() {
        selectSeatView.rightSideSeatsCollectionView.register(RightSideCollectionCell.self, forCellWithReuseIdentifier: RightSideCollectionCell.identifier)
        
        selectSeatView.leftSideSeatsCollectionView.register(LeftSideCollectionCell.self, forCellWithReuseIdentifier: LeftSideCollectionCell.identifier)
        
    }
    
    func setupDelegate() {
        selectSeatView.rightSideSeatsCollectionView.dataSource = self
        selectSeatView.rightSideSeatsCollectionView.delegate = self
        
        selectSeatView.leftSideSeatsCollectionView.dataSource = self
        selectSeatView.leftSideSeatsCollectionView.delegate = self
    }
    
    func defaultSelectedSeats() {
        let selectedRightIndexPaths: [IndexPath] = [IndexPath(item: 0, section: 0),
                                                    IndexPath(item: 5, section: 0),
                                                    IndexPath(item: 11, section: 0)]
        
        let selectedLeftIndexPaths: [IndexPath] = [IndexPath(item: 9, section: 0),
                                                   IndexPath(item: 6, section: 0),
                                                   IndexPath(item: 1, section: 0)]
        
        DispatchQueue.main.async {
            for indexPath in selectedRightIndexPaths {
                if let rightCell = self.selectSeatView.rightSideSeatsCollectionView.cellForItem(at: indexPath) as? RightSideCollectionCell {
                    rightCell.isSelected = true
                    rightCell.rightSeatsView.backgroundColor = .homeRed
                }
            }

            for indexPath in selectedLeftIndexPaths {
                if let leftCell = self.selectSeatView.leftSideSeatsCollectionView.cellForItem(at: indexPath) as? LeftSideCollectionCell {
                    leftCell.isSelected = true
                    leftCell.leftSeatsView.backgroundColor = .homeRed
                }
            }
        }
        
    }
}

//MARK: - Configure Left Side CollectionView
extension SelectSeatViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case selectSeatView.rightSideSeatsCollectionView:
            return 12
        case selectSeatView.leftSideSeatsCollectionView:
            return 12
        default:
            break
        }
        
        return Int()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case selectSeatView.rightSideSeatsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RightSideCollectionCell.identifier, for: indexPath) as! RightSideCollectionCell
            return cell
        case selectSeatView.leftSideSeatsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LeftSideCollectionCell.identifier, for: indexPath) as! LeftSideCollectionCell
            return cell
        default:
            break
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case selectSeatView.rightSideSeatsCollectionView:
            let cellWitdh: CGFloat = (collectionView.frame.width - 10) / 2
            let cellHeight: CGFloat = (collectionView.frame.height - 50) / 6
            return.init(width: cellWitdh, height: cellHeight)
        case selectSeatView.leftSideSeatsCollectionView:
            let cellWitdh: CGFloat = (collectionView.frame.width - 10) / 2
            let cellHeight: CGFloat = (collectionView.frame.height - 50) / 6
            return.init(width: cellWitdh, height: cellHeight)
        default:
            break
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectSeatCount >= maxSelectSeatCount {
            selectSeatView.showError(text: "En fazla 5 koltuk seçebilirsiniz.", image: nil, interaction: false, delay: 1.5)
        return
        }
        switch collectionView {
        case selectSeatView.rightSideSeatsCollectionView:
            let cell = collectionView.cellForItem(at: indexPath) as! RightSideCollectionCell
            if cell.rightSeatsView.backgroundColor == .homeRed {
                selectSeatView.showError(text: "Seçmiş olduğunuz koltuk Doludur.", image: nil, interaction: false, delay: 1.5)
            } else {
                cell.rightSeatsView.backgroundColor = .honeyYellow
                selectSeatCount += 1
            }
            
        case selectSeatView.leftSideSeatsCollectionView:
            let cell = collectionView.cellForItem(at: indexPath) as! LeftSideCollectionCell
            if cell.leftSeatsView.backgroundColor == .homeRed {
                selectSeatView.showError(text: "Seçmiş olduğunuz koltuk Doludur.", image: nil, interaction: false, delay: 1.5)
            } else {
                cell.leftSeatsView.backgroundColor = .honeyYellow
                selectSeatCount += 1
            }
        default:
            break
        }
    }
}




