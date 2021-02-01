//
//  AirportsModel.swift
//  AirportsApp (iOS)
//
//  Created by Francisco Misael Landero Ychante on 31/01/21.
//

import SwiftUI
import Foundation
import MapKit

struct AirportsRequestDataModel {
    var lat : String
    var long: String
    var km : Double
    
    var kmInt : Int {
        return Int(km)
    }
    
    static var dataSample : AirportsRequestDataModel {
        return AirportsRequestDataModel(lat: "-0.103869", long: "51.511142", km: 60)
    }
}
  
// MARK: - Airports
struct AirportsModel: Codable {
    let items: [Item]?
    
    static func get(data: AirportsRequestDataModel ,load:Bool, showError: Bool, success: @escaping (AirportsModel) -> Void){
        Network<AirportsModel,NetAirPorts>().request(target: .get(dataRequest: data) , load: load) { (res) in
            success(res)
        } error: { (err) in
            print(err)
        } failure: { (err) in
            print(err)
        }

    }
}

// MARK: - Item
struct Item: Codable, Identifiable {
    let id = UUID()
    let icao, iata, name, shortName: String?
    let municipalityName: String?
    let location: Location?
    let countryCode: String?
}



enum CountryCode: String, Codable {
    case gb = "GB"
}

// MARK: - Location
struct Location: Codable {
    let lat, lon: Double?
}
