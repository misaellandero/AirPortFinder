//
//  Network.swift
//  AirportsApp (iOS)
//
//  Created by Francisco Misael Landero Ychante on 31/01/21.
//

import Foundation
import Moya

final class Network<T: Decodable, E: TargetType> {
    var provider = MoyaProvider<E>(plugins: [NetworkLoggerPlugin()])
    
    init(_ token: String? = nil) {
        guard let tkn = token else { return }
        let authPlugin = AccessTokenPlugin(tokenClosure: {tkn})
        provider = MoyaProvider<E>(plugins: [authPlugin])
    }
    
    func request(target: E, load: Bool, success successCallback: @escaping (T) -> Void, error errorCallback: @escaping (ResponseModel.RError) -> Void, failure failureCallback: @escaping (MoyaError) -> Void) {
        
        if load { self.loading(true) }
        
        print(target.baseURL, target.path, target.task)
        
        provider.request(target) { (result) in
            if load { self.loading(false) }
                
                switch result {
                case .success(let response):
                    // 1:
                    let decoder = JSONDecoder()
                    if response.statusCode >= 200 && response.statusCode <= 300 {
                        
                        guard let res = try? decoder.decode(T.self, from: response.data) else {
                            let err = ResponseModel.RError(status: 400, error: "Formato incorrecto")
                            self.showError(err.error)
                            errorCallback(err)
                            return
                        }
                        
                        successCallback(res)
                        
                    } else{
                        
                        guard let error = try? decoder.decode(ResponseModel.RError.self, from: response.data) else {
                            let err = ResponseModel.RError(status: 400, error: self.dataToString(response.data))
                            self.showError(err.error)
                            errorCallback(err)
                            return
                        }
                        
                        errorCallback(error)
                        
                    }
                case .failure(let error):
                    
                    self.showError(nil)
                    failureCallback(error)
                }
        }
    }
    
    

    func loading(_ activate: Bool){
        if activate {
            print("cargando")
        }else{
            print("ya no cargando")
        }
    }
    
    func dataToString(_ data: Data) -> String {
        guard let conv = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) else { return "Error"}
        guard let json = conv as? NSDictionary else {return "Error"}
        return String(describing: json)
    }
    
    func printData(_ data: Data){
        guard let conv = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) else { return }
        guard let json = conv as? NSDictionary else {return}
        print("Respuesta: \(String(describing: json))")
    }
    
    
    func showError(_ messg: String?) {
        //error
    }
}


