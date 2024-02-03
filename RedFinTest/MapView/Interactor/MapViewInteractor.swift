//
//  MapViewInterface.swift
//  RedFinTest
//
//  Created by Jael on 02/02/2024.
//

import Foundation



class MapViewInteractor: MapPresenterToInteractor {
    
    var presenter: MapInteractorToPresenter?
    
    func retrieveNearFoodTrucks() {
         guard let url = URL(string: "https://data.sfgov.org/resource/bbb8-hzi6.json") else {
             self.manageRetriveError(error: .invalidURL)
             return
         }

         URLSession.shared.dataTask(with: url) { data, response, error in
             if let error = error {
                 self.manageRetriveError(error: .other(error))
                 return
             }

             guard let data = data else {
                 self.manageRetriveError(error: .noData)
                 return
             }

             do {
                 let foodTrucks = try JSONDecoder().decode([FoodTruckModel].self, from: data)
                 let filteredFoodTrucks = self.filterFoodTrucks(foodTrucks)
                 self.presenter?.setNearFoodTrucks(foodTrucksInfo: filteredFoodTrucks)
             } catch let decodingError as DecodingError {
                 self.manageRetriveError(error: .decodingError(decodingError))
             } catch {
                 self.manageRetriveError(error: .other(error))
             }
         }.resume()
     }
    
    
    private func filterFoodTrucks(_ foodTrucks: [FoodTruckModel]) -> [FoodTruckModel] {
        let currentDate = Date().dayOfWeek()!
        let currentHour = Date.currentHour
        
        guard let pacificTimeZone = TimeZone(identifier: "America/Los_Angeles") else {
            print("Error to obtain Pacífico zone")
            return []
        }
        var calendar = Calendar.current
        calendar.timeZone = pacificTimeZone
        
        let dayFilter =  foodTrucks.filter { $0.dayOfWeekStr == currentDate}
        let amFilter = dayFilter.filter{ currentHour >= $0.start24?.toHour() ?? 0 }
        let fmFilter = amFilter.filter{ currentHour <= $0.end24?.toHour() ?? 0 }
        return fmFilter
    }

    private func manageRetriveError(error: FoodTruckError) {
        switch error {
        case .invalidURL:
            self.presenter?.setInternetError(error: "Invalid URL")
        case .noData:
            self.presenter?.setInternetError(error: "No Data")
        case .decodingError(let decodingError):
      
            switch decodingError {
            case .typeMismatch(let type, let context):
                let errorDescription = "Type mismatch: Expected \(type) at \(context.codingPath)"
                print(errorDescription)
               
                self.presenter?.setInternetError(error: errorDescription)
 
            default:
                let errorDescription = "An unexpected decoding error occurred: \(decodingError)"
                print(errorDescription)
                self.presenter?.setInternetError(error: errorDescription)
            }
        case .other(let otherError):
            self.presenter?.setInternetError(error: otherError.localizedDescription)
        }
    }
}
