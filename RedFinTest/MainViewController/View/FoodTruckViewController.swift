//
//  FoodTruckViewController.swift
//  RedFinTest
//
//  Created by Jael on 02/02/2024.
//

import UIKit

class FoodTruckViewController: UIViewController {
    
    
    @IBOutlet var standByView: UIView!
    @IBOutlet weak var foodTruckInformationTable: UITableView!{
        didSet {
            foodTruckInformationTable.delegate = self
            foodTruckInformationTable.dataSource = self
        }
    }
    public var router: MainViewRouter?
    public var presenter: MainViewToPresenter?
    private var foodTruckList = [FoodTruckModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let mapButton: UIBarButtonItem = UIBarButtonItem(title: "Map", style: .done, target: self, action: #selector(moveToMapView))
        foodTruckInformationTable.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        foodTruckInformationTable.rowHeight = UITableView.automaticDimension
        foodTruckInformationTable.estimatedRowHeight = 200.0
        presenter?.retrieveNearFoodTrucks()
        navigationItem.rightBarButtonItem = mapButton
        navigationItem.setHidesBackButton(true, animated: true)
        standByView.alpha = 0.5
        title = "Food Trucks"
    }
    
    @objc func moveToMapView() {
        self.presenter?.MoveToMapView()
    }
}

extension FoodTruckViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodTruckList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        cell.titleLabel.text = "  \(foodTruckList[indexPath.row].optionalText ?? "")"
        cell.descriptionLabel.text = "\(foodTruckList[indexPath.row].locationdesc ?? "")"
        cell.subTitleLabel.text = "\(foodTruckList[indexPath.row].location ?? "")"
        cell.hourLabel.text = "\(foodTruckList[indexPath.row].start24 ?? "" ) AM - \(foodTruckList[indexPath.row].end24 ?? "" )PM "
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
}

extension FoodTruckViewController: MainPresenterToView {
    func setNearFoodTrucks(foodTrucksInfo: [FoodTruckModel]) {
        foodTruckList.append(contentsOf: foodTrucksInfo)
        DispatchQueue.main.async { [weak self] in
            self?.standByView.isHidden = true
            self?.foodTruckInformationTable.reloadData()
      
        }
    }
    
    func onResponseError(error: String) {
        
    }
    
    
}
