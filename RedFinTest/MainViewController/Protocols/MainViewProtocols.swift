//
//  MainViewProtocols.swift
//  RedFinTest
//
//  Created by Jael on 02/02/2024.
//

import Foundation

//MARK:= View To Presenter
protocol MainViewToPresenter: AnyObject {
    
    var view: MainPresenterToView?{get set }
    var interactor:MainPresenterToInteractor?{get set}
    var router:MainPresenterToRouter?{get set}
    
    func MoveToMapView()
    func retrieveNearFoodTrucks()
}

//MARK: Presenter To View
protocol MainPresenterToView: AnyObject {
    func onResponseError(error:String)
    func setNearFoodTrucks(foodTrucksInfo: [FoodTruckModel])
}

//MARK: Presenter To Router

protocol MainPresenterToRouter: AnyObject {
    
    func moveToMapView() -> MapViewController
}
//MARK: Presenter To Interactor
protocol MainPresenterToInteractor: AnyObject {
    func retrieveNearFoodTrucks() 
    func retrieveNearFoodTruckTest(withUrl url: String, completion: @escaping (Data?) -> Void)
    func testRetreieveNearFoodTrucks(withURL url:String ,completionHandler: @escaping (Result<[FoodTruckModel], FoodTruckError>) -> Void) 
}
//MARK: = Interactor to Presenter
protocol MainInteractorToPresenter: AnyObject {
    func setNearFoodTrucks(foodTrucksInfo: [FoodTruckModel])
    func setInternetError(error: String)

}

