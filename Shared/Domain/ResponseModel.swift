//
//  AirportsModel.swift
//  AirportsApp (iOS)
//
//  Created by Francisco Misael Landero Ychante on 31/01/21.
//

import Foundation


struct ResponseModel {
    
    struct Base<T: Decodable>: Decodable {
        var message: String?
        var status: Int
        var data: T
    }


    struct List<T: Decodable>: Decodable {
        var message: String?
        var status: Int
        var data: [T]
    }


    struct Basic: Decodable {
        var message: String?
        var status: Int?
    }
    
    struct RError: Error, Decodable {
        var status: Int
        var error: String
    }
}
