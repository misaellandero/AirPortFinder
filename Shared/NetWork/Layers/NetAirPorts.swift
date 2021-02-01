//
//  AirPorts.swift
//  AirportsApp (iOS)
//
//  Created by Francisco Misael Landero Ychante on 31/01/21.
//
 
import Foundation
import Moya

enum NetAirPorts {
    case get(dataRequest : AirportsRequestDataModel)
}

extension NetAirPorts: TargetType {
    
    var baseURL: URL {
        return AccessURL.aerodataboxApiUrl
    }
    
    var path: String {
        switch self {
        case .get(let dataRequest):
                   return "search/location/\(dataRequest.long)/\(dataRequest.lat)/km/\(dataRequest.kmInt)/16"
   
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .get:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .get:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .get:
            return  [
                "x-rapidapi-key": "\(AccessURL.aerodataboxApiKey)",
                "x-rapidapi-host": "aerodatabox.p.rapidapi.com"
            ]
        }
    }
    
    var authorizationType: AuthorizationType {
        switch self {
        case .get:
            return .bearer
        }
    }
}

