//
//  MapViewRouter.swift
//  RedFinTest
//
//  Created by Jael on 02/02/2024.
//

import Foundation
import UIKit

public class MapViewRouter: MapPresenterToRouter{
   
    var view: UIViewController?
    
    
    public static func createMapView() -> UIViewController{
        
        let view = MapViewController()
        
        let presenter = MapViewPresenter()
        let interactor = MapViewInteractor()
        let router = MapViewRouter()
        router.view = view
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
    
        return view
    }
    
    func backToListView() {
        view?.navigationController?.popViewController(animated: true)
    }
 

}

