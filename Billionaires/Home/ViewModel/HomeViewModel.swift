//
//  HomeViewModel.swift
//  Billionaires
//
//  Created by Umair Hanif on 22/08/2022.
//

import Foundation

final class HomeViewModel {
    
    var rank: Int?
    var avatar: String?
    var fullName: String?
    var countryOfCitizenship: String?
    var netWorthInUSD: String?
    var age: String?
    var source: String?
    var state: String?
    var city: String?
    var industries: String?
    var bio: String?
    var about: String?
    var finencialAssets: [FinancialAsset]?
    
    let data : ObservableObject<[HomeViewModel]?> = ObservableObject([])
    
    func getBillionairesData() {
        
        let sharedNetwork = NetworkService.shared
        
        sharedNetwork.getBillionairesData { success, data in
            self.data.value = success ? data : nil
        }
        
    }
    
    init() {
        
    }
    
    convenience init(data: BillionairesDataModel) {
        self.init()
        
        self.rank = data.rank
        self.avatar = data.person.squareImage
        self.fullName = data.person.name
        self.countryOfCitizenship = data.countryOfCitizenship
        self.netWorthInUSD = "\(data.finalWorth) USD"
        self.age = getAge(birthday: data.birthDate ?? 0)
        self.source = data.source
        self.state = data.state
        self.city = data.city
        
        var industries = ""
        for industry in data.industries {
            industries += "\(industry)"
        }
        self.industries = industries
        
        var bios = ""
        for bio in data.bios {
            bios += "\(bio) "
        }
        self.bio = bios
        
        var abouts = ""
        for about in data.abouts ?? [] {
            abouts += "\(about) "
        }
        self.about = abouts
        
        self.finencialAssets = data.financialAssets
        
    }
    
    func getAge(birthday: Int) -> String {
        
        let epocTime = TimeInterval(birthday)
        let date = Date(timeIntervalSince1970: epocTime)
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components(.year, from: date, to: now, options: [])
        if let totalYears = calcAge.year, totalYears < 0 || totalYears > 150 {
            return ""
        } else {
            let age = "\(String(describing: calcAge.year)) years"
            return age
        }
        
    }
    
    
}
