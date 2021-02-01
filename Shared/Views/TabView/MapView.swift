//
//  MapView.swift
//  AirportsApp (iOS)
//
//  Created by Francisco Misael Landero Ychante on 01/02/21.
//
import MapKit 
import SwiftUI

struct MapView: View {
    // para obtener ubicacion actual
    let locationFetcher = LocationFetcher()
    
    @Binding var region : MKCoordinateRegion
    @Environment(\.colorScheme) var colorScheme
    
    @State private var trackingMode = MapUserTrackingMode.follow
    
    @Binding var locations : [Item]
    
    var body: some View {
      
        
        Map(coordinateRegion: $region, interactionModes:.all, showsUserLocation: true, userTrackingMode: $trackingMode, annotationItems: locations){
            (airport) -> MapAnnotation<airPortMarket> in
            MapAnnotation(coordinate: getCordinate(item: airport) , content: {
                
                    airPortMarket(item: airport)
              
            })
        }
    }
    
 
    
    func getCordinate(item : Item) -> CLLocationCoordinate2D {
        print(item)
        return CLLocationCoordinate2D(latitude: item.location?.lat ?? 0.0 , longitude:  item.location?.lon ?? 0.0 )
        
    }
}

 
struct airPortMarket : View {
    @State var item : Item
    var body: some View {
        NavigationLink(destination: AirPortDetailView(item: item)){
            Image(systemName: "airplane.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
        }
            
        
    }
}
