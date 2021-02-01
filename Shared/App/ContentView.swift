//
//  ContentView.swift
//  Shared
//
//  Created by Francisco Misael Landero Ychante on 31/01/21.
//

import SwiftUI
import MapKit
import LocalAuthentication

struct ContentView: View {
    
    // para obtener ubicacion actual
    let locationFetcher = LocationFetcher()
    var locationManager = CLLocationManager()
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.158906, longitude: -74.255084), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    @State var dataModel = AirportsRequestDataModel.dataSample
    
    var body: some View {
        KmRadiusSearchView(dataModel: $dataModel, region: $region)
            .onAppear{
                getCurrentLocation()
            
            }
    }
    
    func getCurrentLocation() {
        
        locationManager.requestWhenInUseAuthorization()
        
        self.locationFetcher.start()
        if let location =
        self.locationFetcher.lastKnownLocation {
            
            print("Your location is \(location)")
            let cor =  self.locationFetcher.lastKnownLocation
            dataModel.long = String(cor?.latitude ?? 0)
            dataModel.lat = String(cor?.longitude ?? 0)
            region = MKCoordinateRegion(center: self.locationFetcher.lastKnownLocation!, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        } else {
            print("Your location is unknown")
            
        }
    }
   
}

 
