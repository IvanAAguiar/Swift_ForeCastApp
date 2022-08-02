//
//  ListView.swift
//  weatherForecast
//
//  Created by user225360 on 7/27/22.
//

import SwiftUI

struct CitiesView: View {
    
    @StateObject var vm : CitiesViewModel = CitiesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.savedEntities) {
                    entity in
                    Text(entity.name ?? "NO NAME")
                        .onLongPressGesture() {
                            vm.updateCity(entity: entity)
                        }
                }
                .onDelete(perform: vm.deleteCity(indexSet:))
            }
            .listStyle(PlainListStyle())
        }
    }
}

