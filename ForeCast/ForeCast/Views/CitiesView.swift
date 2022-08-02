//
//  ListView.swift
//  ForeCast
//
//  Created by Ivan Aguiar on 7/27/22.
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
                    //TODO: It is soppose to onTapGesture changes the view and fetches the data again
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

