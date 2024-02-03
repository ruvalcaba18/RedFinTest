//
//  MainViewRouter.swift
//  RedFinTest
//
//  Created by Jael on 02/02/2024.
//

import Foundation
import UIKit

public class MainViewRouter: MainPresenterToRouter{
   
    var view: UIViewController?
    
    public static func createMainView() -> UIViewController{
        
        let view = FoodTruckViewController()
        
        let presenter = MainViewPresenter()
        let interactor = MainViewInteractor()
        let router = MainViewRouter()
        router.view = view

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
    
        return view
    }
    
    
    func moveToMapView() -> MapViewController {
        let mapView = MapViewRouter.createMapView() as! MapViewController
        view?.navigationController?.pushViewController(mapView, animated: true)
        return mapView
    }
    
}

