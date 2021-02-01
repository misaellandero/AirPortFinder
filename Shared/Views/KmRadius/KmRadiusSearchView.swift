//
//  KmRadiusSearchView.swift
//  AirportsApp (iOS)
//
//  Created by Francisco Misael Landero Ychante on 31/01/21.
//

import SwiftUI
import MapKit

struct KmRadiusSearchView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var dataModel : AirportsRequestDataModel
    @Binding  var region : MKCoordinateRegion
    
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    Image(systemName: "airplane.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    Text("AIRPORTS")
                        .fontWeight(.black)
                    
                    Text("finder")
                            .font(.largeTitle)
                }
                .font(.system(size: 30))
                
                .padding()
                .padding()
                
                
                Spacer()
                Text("\(dataModel.km, specifier: "%.0f")")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                
                Slider(value: $dataModel.km, in: 0...100, step: 1)
                Text("Radius on KM")
                        .font(.subheadline)
                Spacer()
                NavigationLink(destination: TabBarView(dataModel: $dataModel, region: $region)) {
                    HStack{
                        Spacer()
                        Text("Search")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding()
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
                }
                Spacer()
            }
            .foregroundColor(.blue)
            .padding()
            .navigationTitle("Radius")
            
            
        }
    }
}
 
