//
//  HomeViewModel.swift
//  BusBooking
//
//  Created by Fatih on 24.06.2024.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func openTicketListController(boardingFromCity: String, goingFromCity: String)
}

class HomeViewModel {
    var fromCityName: String?
    var goingCityName: String?
    var homeView = HomeView()
    weak var viewDelegate: HomeViewModelDelegate?
    
    let cities = ["Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Aksaray", "Amasya", "Ankara", "Antalya", "Ardahan", "Artvin", "Aydın", "Balıkesir", "Bartın", "Batman", "Bayburt", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Düzce", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkâri", "Hatay", "Iğdır", "Isparta", "İstanbul", "İzmir", "Kahramanmaraş", "Karabük", "Karaman", "Kars", "Kastamonu", "Kayseri", "Kırıkkale", "Kırklareli", "Kırşehir", "Kilis", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Mardin", "Mersin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Osmaniye", "Rize", "Sakarya", "Samsun", "Şanlıurfa", "Siirt", "Sinop", "Şırnak", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Uşak", "Van", "Yalova", "Yozgat", "Zonguldak"]
    
    
    func findsButtonTapped() {
        guard let fromCityName, let goingCityName else {
            homeView.showError(text: "Hareket edeceğiniz şehiri veya gidilecek şehri seçmediniz lütfen kontrol ediniz.", image: nil, interaction: false, delay: 2)
            return
        }
        
        if fromCityName == goingCityName {
            homeView.showError(text: "Hareket edilen şehir ile gidilecek olan şehir aynı olamaz lütfen kontrol ediniz.", image: nil, interaction: false, delay: 2)
            return
        }
            
        viewDelegate?.openTicketListController(boardingFromCity: fromCityName, goingFromCity: goingCityName)
    }
}
