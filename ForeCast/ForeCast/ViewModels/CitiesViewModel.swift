//
//  ListViewModel.swift
//  ForeCast
//
//  Created by Ivan Aguiar on 7/27/22.
//

import Foundation
import CoreData

class CitiesViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [CityEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "weatherForecast")
        container.loadPersistentStores{(description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            } else {
                print("Successfully loade core data!")
            }
        }
        fetchCities()
    }
    
    func fetchCities() {
        let request = NSFetchRequest<CityEntity>(entityName: "CityEntity")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    //TODO: To clean the list for repeated items
    func addCity(text: String) {
        let newCity = CityEntity(context: container.viewContext)
        newCity.name = text
        saveCity()
    }
    
    func updateCity(entity: CityEntity) {
        let currentName = entity.name ?? ""
            //TODO create a new name
        let newName = currentName + currentName
        entity.name = newName
        saveCity()
    }
    
    func deleteCity(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveCity()
    }
    
    func saveCity() {
        do {
            try container.viewContext.save()
            fetchCities()
        } catch let error {
            print("Error saving. \(error)")
        }
    }
}
