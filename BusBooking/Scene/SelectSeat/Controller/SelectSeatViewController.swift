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
        setupNavigationBarItem()
        selectSeatView.rightSideSeatsCollectionView.reloadData()
        selectSeatView.leftSideSeatsCollectionView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
    
    func setupNavigationBarItem() {
        let nextButton = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextButtonTapped))
        navigationItem.rightBarButtonItem = nextButton
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func nextButtonTapped() {
        let vc = GuestDetailsViewController()
        if selectSeatCount == 0 {
            selectSeatView.showError(text: "En az bir adet koltuk seçimi yapmalısınız.", image: nil, interaction: false, delay: 2)
        } else {
            vc.navigationItem.title = selectSeatView.companyName.text
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}

//MARK: - Configure Left Side CollectionView
extension SelectSeatViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case selectSeatView.rightSideSeatsCollectionView:
            return selectSeatViewModel.rightSeatNumbers.count
        case selectSeatView.leftSideSeatsCollectionView:
            return selectSeatViewModel.leftSeatNumbers.count
        default:
            break
        }
        
        return Int()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case selectSeatView.rightSideSeatsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RightSideCollectionCell.identifier, for: indexPath) as! RightSideCollectionCell
            let data = selectSeatViewModel.rightSeatNumbers[indexPath.item].number
            if selectSeatViewModel.reservedRightSeats.contains(where: { $0.number == data }) {
                cell.rightSeatsView.backgroundColor = .homeRed
            } else {
                cell.rightSeatsView.backgroundColor = .mainGray
            }
            cell.rightSeatsNumbers.text = data
            
            return cell
        case selectSeatView.leftSideSeatsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LeftSideCollectionCell.identifier, for: indexPath) as! LeftSideCollectionCell
            let data = selectSeatViewModel.leftSeatNumbers[indexPath.item].number
            if selectSeatViewModel.reservedLeftSeats.contains(where: { $0.number == data }) {
                cell.leftSeatsView.backgroundColor = .homeRed
            } else {
                cell.leftSeatsView.backgroundColor = .mainGray
            }
            cell.leftSeatsNumbers.text = data
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
        
        switch collectionView {
        case selectSeatView.rightSideSeatsCollectionView:
            let currentSelectedRightSeat = selectSeatViewModel.rightSeatNumbers[indexPath.item]
            let cell = collectionView.cellForItem(at: indexPath) as! RightSideCollectionCell
            if selectSeatViewModel.reservedRightSeats.contains(where: { $0.number == currentSelectedRightSeat.number }) {
                selectSeatView.showError(text: "Seçmiş olduğunuz koltuk Doludur.", image: nil, interaction: false, delay: 1.5)
            } else {
                if selectSeatViewModel.selectedRightSeats.contains(where: { $0.number == currentSelectedRightSeat.number }) {
                    cell.rightSeatsView.backgroundColor = .mainGray
                    selectSeatCount -= 1
                    if let removeIndex = selectSeatViewModel.selectedRightSeats.firstIndex(where: { $0.number == currentSelectedRightSeat.number }) {
                        selectSeatViewModel.selectedRightSeats.remove(at: removeIndex)
                    }
                    
                } else {
                    if selectSeatCount >= maxSelectSeatCount {
                        selectSeatView.showError(text: "En fazla 5 koltuk seçebilirsiniz.", image: nil, interaction: false, delay: 1.5)
                        return
                    } else {
                        cell.rightSeatsView.backgroundColor = .honeyYellow
                        selectSeatCount += 1
                        selectSeatViewModel.selectedRightSeats.append(currentSelectedRightSeat)
                    }
                    
                }
            }
            
        case selectSeatView.leftSideSeatsCollectionView:
            let currentSelectedRightSeat = selectSeatViewModel.leftSeatNumbers[indexPath.item]
            let cell = collectionView.cellForItem(at: indexPath) as! LeftSideCollectionCell
            if selectSeatViewModel.reservedLeftSeats.contains(where: { $0.number == currentSelectedRightSeat.number }) {
                selectSeatView.showError(text: "Seçmiş olduğunuz koltuk Doludur.", image: nil, interaction: false, delay: 1.5)
            } else {
                if selectSeatViewModel.selectedLeftSeats.contains(where: { $0.number == currentSelectedRightSeat.number }) {
                    cell.leftSeatsView.backgroundColor = .mainGray
                    selectSeatCount -= 1
                    if let removeIndex = selectSeatViewModel.selectedLeftSeats.firstIndex(where: { $0.number == currentSelectedRightSeat.number }) {
                        selectSeatViewModel.selectedLeftSeats.remove(at: removeIndex)
                    }
                    
                } else {
                    if selectSeatCount >= maxSelectSeatCount {
                        selectSeatView.showError(text: "En fazla 5 koltuk seçebilirsiniz.", image: nil, interaction: false, delay: 1.5)
                        return
                    } else {
                        cell.leftSeatsView.backgroundColor = .honeyYellow
                        selectSeatCount += 1
                        selectSeatViewModel.selectedLeftSeats.append(currentSelectedRightSeat)
                    }
                    
                }
                
            }
        default:
            break
        }
    }
    
}




