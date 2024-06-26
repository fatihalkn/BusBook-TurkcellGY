//
//  TabbarViewController.swift
//  BusBooking
//
//  Created by Fatih on 26.06.2024.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = .homeRed
        self.tabBar.barTintColor = .white
        self.tabBar.unselectedItemTintColor = .darkGray
        self.tabBar.backgroundColor = .white
        setupTabs()

    }
    
    private func setupTabs() {
        let home = creatTabs(title: "Home", image: .tabbarHome, vc: HomeViewController())
        let tickets = creatTabs(title: "Tickets", image: .tabbarTicket, vc: TicketListController())
        self.setViewControllers([home,tickets], animated: true)
    }
    
    private func creatTabs(title:String, image: UIImage, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        return nav
    }

   

}
