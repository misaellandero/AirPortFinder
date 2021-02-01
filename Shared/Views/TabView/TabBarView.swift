//
//  TabView.swift
//  AirportsApp (iOS)
//
//  Created by Francisco Misael Landero Ychante on 01/02/21.
//

import SwiftUI
import MapKit


struct TabBarView: View {
    
    @State private var locations = [Item]()
    @Binding var dataModel : AirportsRequestDataModel
    @Binding  var region : MKCoordinateRegion
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        TabView{
            MapView(region: $region, locations: $locations)
                .onAppear(
                    
                )
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }

            ListView(locations: locations)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                } 
            
        }
        .onAppear(perform: searchAirports)
        .navigationBarTitle("Airports on the Area", displayMode: .inline)
        
    }
    
    func searchAirports(){
        DispatchQueue.main.async {
            AirportsModel.get(data: dataModel , load: false, showError: false) { (res) in
                if let markets = res.items {
                    locations = markets
                    print(markets)
                }
               
            }
        }
    }
}

 
