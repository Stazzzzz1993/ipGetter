//
//  DataModel.swift
//  ipGetter
//
//  Created by Admin on 3/15/22.
//

import Foundation

//struct DataModel: Codable {
//    var query: String
//    var status: String
//    var country: String
//    var countryCode: String
//    var region: String
//    var regionName: String
//    var city: String
//    var zip: String
//    var lat: Int
//    var lon: Int
//    var timezone: String
//    var isp: String
//    var org: String
//
//    enum CodingKeys: String, CodingKey {
//        case query
//        case status
//        case country
//        case countryCode
//        case region
//        case regionName
//        case city
//        case zip
//        case lat
//        case lon
//        case timezone
//        case isp
//        case org
//
//    }
//}


//struct DataModel: Codable {
//    let status, country, countryCode, region: String
//    let regionName, city, zip: String
//    let lat, lon: Double
//    let timezone, isp, org, welcomeAs: String
//    let query: String
//
//    enum CodingKeys: String, CodingKey {
//        case status, country, countryCode, region, regionName, city, zip, lat, lon, timezone, isp, org
//        case welcomeAs = "as"
//        case query
//    }
//}

// MARK: - Location
struct Location: Codable {
    let ip, type, continentCode, continentName: String
    let countryCode, countryName, regionCode, regionName: String
    let city, zip: String
    let latitude, longitude: Double
    let location: LocationClass

    enum CodingKeys: String, CodingKey {
        case ip, type
        case continentCode = "continent_code"
        case continentName = "continent_name"
        case countryCode = "country_code"
        case countryName = "country_name"
        case regionCode = "region_code"
        case regionName = "region_name"
        case city, zip, latitude, longitude, location
    }
}

// MARK: - LocationClass
struct LocationClass: Codable {
    let geonameID: Int
    let capital: String
    let languages: [Language]
    let countryFlag: String
    let countryFlagEmoji, countryFlagEmojiUnicode, callingCode: String
    let isEu: Bool

    enum CodingKeys: String, CodingKey {
        case geonameID = "geoname_id"
        case capital, languages
        case countryFlag = "country_flag"
        case countryFlagEmoji = "country_flag_emoji"
        case countryFlagEmojiUnicode = "country_flag_emoji_unicode"
        case callingCode = "calling_code"
        case isEu = "is_eu"
    }
}

// MARK: - Language
struct Language: Codable {
    let code, name, native: String
}



