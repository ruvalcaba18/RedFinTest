//
//  ViewController.swift
//  RedFinTest
//
//  Created by Jael on 02/02/2024.
//

import UIKit

class MainViewController: UIViewController {
    
    var router: MainViewRouter?
    var presenter: MainViewToPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.presenter?.retrieveNearFoodTrucks()
    }

    @IBAction func moveToMaP(_ sender: UIButton) {
        let mapView = MapViewController()
        self.navigationController?.pushViewController(mapView, animated: true)
    
    }
    
}

extension MainViewController: MainPresenterToView{
    func setNearFoodTrucks(foodTrucksInfo: [FoodTruckModel]) {
        
    }
    
    
    func onResponseError(error: String) {
        
    }
    
    
}
