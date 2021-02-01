//
//  ListView.swift
//  AirportsApp (iOS)
//
//  Created by Francisco Misael Landero Ychante on 01/02/21.
//

import SwiftUI

struct ListView: View {
    @State  var locations : [Item]
    var body: some View {
        List{
            ForEach(locations){ item in
                NavigationLink(destination: AirPortDetailView(item: item)){
                    listRow(item: item)
                }
            }
        } 
    }
}

struct listRow : View {
    @State var item : Item
    var body: some View {
        HStack{
            Image(systemName: "airplane.circle.fill")
            Text(item.shortName ?? "Sin nombre")
        }
    }
}

 
