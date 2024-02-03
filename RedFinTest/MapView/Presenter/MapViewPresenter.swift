//
//  MapViewPresenter.swift
//  RedFinTest
//
//  Created by Jael on 02/02/2024.
//

import Foundation
class MapViewPresenter: MapViewToPresenter {
  
    var view: MapPresenterToView?
    var interactor: MapPresenterToInteractor?
    var router: MapPresenterToRouter?
    
    func backToList() {
        router?.backToListView()
    }
    
    func retrieveNearFoodTrucks() {
        interactor?.retrieveNearFoodTrucks()
    }
    
}

extension MapViewPresenter: MapInteractorToPresenter{
    
    func setInternetError(error: String) {
        view?.onResponseError(error: error)
    }
    
    func setNearFoodTrucks(foodTrucksInfo: [FoodTruckModel]) {
        view?.setNearFoodTrucks(foodTrucksInfo: foodTrucksInfo)
    }

}
