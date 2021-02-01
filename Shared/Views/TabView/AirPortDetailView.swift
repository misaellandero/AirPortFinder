//
//  AirPortDetailView.swift
//  AirportsApp (iOS)
//
//  Created by Francisco Misael Landero Ychante on 01/02/21.
//

import SwiftUI

struct AirPortDetailView: View {
    @State var item : Item
    var body: some View {
    
            VStack{
                HStack{
                    
                    Text(item.name ?? "unknow")
                    Spacer()
                }
                HStack{
                    
                    Text(item.municipalityName ?? "unknow")
                    Spacer()
                }
                HStack{
                    Text(item.countryCode ?? "unknow")
                    Spacer()
                }
              
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("Details", displayMode: .inline)
      
    }
}

 
