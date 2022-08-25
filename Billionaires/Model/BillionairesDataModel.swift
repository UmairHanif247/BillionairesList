//
//  BillionairesDataModel.swift
//  Billionaires
//
//  Created by Umair Hanif on 22/08/2022.
//

import Foundation

// MARK: - WelcomeElement
struct BillionairesDataModel: Codable {
    var name: Name
    var year: Int
    var uri, bio: String
    var rank: Int
    var listURI: ListURI
    var finalWorth: Double
    var person: Person
    var visible: Bool
    var personName: String
    var state, city: String?
    var source: String
    var industries: [String]
    var countryOfCitizenship: String
    var timestamp, version: Int
    var naturalID: String
    var position: Int
    var imageExists: Bool
    var gender: Gender?
    var birthDate: Int?
    var lastName: String
    var financialAssets: [FinancialAsset]?
    var date: Int
    var wealthList: Bool
//    var estWorthPrev, privateAssetsWorth: Double
    var estWorthPrev: Double
    var familyList, interactive: Bool
    var archivedWorth: Int
    var thumbnail: String?
    var squareImage: String?
    var bioSuppress: Bool
    var csfDisplayFields: [CsfDisplayField]
    var bios: [String]
    var abouts: [String]?

    enum CodingKeys: String, CodingKey {
        case name, year, uri, bio, rank
        case listURI = "listUri"
        case finalWorth, person, visible, personName, state, city, source, industries, countryOfCitizenship, timestamp, version
        case naturalID = "naturalId"
//        case position, imageExists, gender, birthDate, lastName, financialAssets, date, wealthList, estWorthPrev, privateAssetsWorth, familyList, interactive, archivedWorth, thumbnail, squareImage, bioSuppress, csfDisplayFields, bios, abouts
        case position, imageExists, gender, birthDate, lastName, financialAssets, date, wealthList, estWorthPrev, familyList, interactive, archivedWorth, thumbnail, squareImage, bioSuppress, csfDisplayFields, bios, abouts
    }
}

enum CsfDisplayField: String, Codable {
    case age = "age"
    case bio = "bio"
    case bios = "bios"
    case countryOfCitizenship = "countryOfCitizenship"
    case finalWorth = "finalWorth"
    case personName = "personName"
    case rank = "rank"
    case source = "source"
}

// MARK: - FinancialAsset
struct FinancialAsset: Codable {
    var exchange, ticker: String?
    var companyName: String
    var numberOfShares, sharePrice: Double
    var currencyCode: String
    var exchangeRate: Double
    var interactive: Bool
    var currentPrice, exerciseOptionPrice: Double?
}

enum Gender: String, Codable {
    case f = "F"
    case m = "M"
}

enum ListURI: String, Codable {
    case rtb = "rtb"
}

enum Name: String, Codable {
    case realTimeBillionaires = "Real-Time Billionaires"
}

// MARK: - Person
struct Person: Codable {
    var name, uri: String
    var imageExists: Bool
    var squareImage: String?
}

typealias Billionaires = [BillionairesDataModel]
