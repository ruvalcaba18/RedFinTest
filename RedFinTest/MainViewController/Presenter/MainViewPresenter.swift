//
//  MainViewPresenter.swift
//  RedFinTest
//
//  Created by Jael on 02/02/2024.
//

import Foundation
class MainViewPresenter: MainViewToPresenter {
   
    
    var view: MainPresenterToView?
    
    var interactor: MainPresenterToInteractor?
    
    var router: MainPresenterToRouter?
    
    func MoveToMapView() {
        router?.moveToMapView()
    }
    
    func retrieveNearFoodTrucks() {
        interactor?.retrieveNearFoodTrucks()
    }
    
}

extension MainViewPresenter: MainInteractorToPresenter{
    func setNearFoodTrucks(foodTrucksInfo: [FoodTruckModel]) {
        view?.setNearFoodTrucks(foodTrucksInfo: foodTrucksInfo)
    }
    
    
    func setInternetError(error: String) {
        view?.onResponseError(error: error)
    }
    

}
