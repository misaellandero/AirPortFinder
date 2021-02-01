//
//  Constants.swift
//  AirportsApp (iOS)
//
//  Created by Francisco Misael Landero Ychante on 31/01/21.
//

import Foundation

enum ProductionEnvironment {
    case developer,
         production
}


struct AccessURL {
    static var environment: ProductionEnvironment = .developer
    
    static var aerodataboxApiUrl: URL {
        switch environment {
        case .developer:
            return URL(string: "https://aerodatabox.p.rapidapi.com/airports")!
        default:
            return URL(string: "https://aerodatabox.p.rapidapi.com/airports")!
        }
    }
    
    static var aerodataboxApiKey: String {
        switch environment {
        case .developer:
            return "3252bbcb3bmshf6435f2eb9147cbp1d757ajsn4e7f130375af"
        default:
            return "3252bbcb3bmshf6435f2eb9147cbp1d757ajsn4e7f130375af"
        }
    }
     
}

