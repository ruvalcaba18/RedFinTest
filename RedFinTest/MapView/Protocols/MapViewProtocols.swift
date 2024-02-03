//
//  MapViewProtocols.swift
//  RedFinTest
//
//  Created by Jael on 02/02/2024.
//

import Foundation

//MARK:= View To Presenter
protocol MapViewToPresenter: AnyObject {
    
    var view: MapPresenterToView?{get set }
    var interactor:MapPresenterToInteractor?{get set}
    var router:MapPresenterToRouter?{get set}
    func backToList()
    func retrieveNearFoodTrucks()
}

//MARK: Presenter To View
protocol MapPresenterToView: AnyObject {
    func onResponseError(error:String)
    func setNearFoodTrucks(foodTrucksInfo: [FoodTruckModel])
}

//MARK: Presenter To Router
protocol MapPresenterToRouter: AnyObject {
    func backToListView() 

}
//MARK: Presenter To Interactor
protocol MapPresenterToInteractor: AnyObject {
    func retrieveNearFoodTrucks()

}
//MARK: = Interactor to Presenter
protocol MapInteractorToPresenter: AnyObject {
    func setNearFoodTrucks(foodTrucksInfo: [FoodTruckModel])
    func setInternetError(error: String)

}
