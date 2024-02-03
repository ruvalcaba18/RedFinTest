//
//  MapViewController.swift
//  RedFinTest
//
//  Created by Jael on 02/02/2024.
//

import UIKit
import MapKit

final class MapViewController: UIViewController {
    
    @IBOutlet var informationView: UIView!
    @IBOutlet var hourOpenLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var streetLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var mapView: MKMapView!
    var router: MapViewRouter?
    var presenter: MapViewToPresenter?
    private let sanFranciscoCoordinates = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
    private var currentRegionRadius: CLLocationDistance = 1000
    private var foodTruckList = [FoodTruckModel]()
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Food Trucks"
        navigationItem.setHidesBackButton(true, animated: true)
        let listButton: UIBarButtonItem = UIBarButtonItem(title: "List", style: .done, target: self, action: #selector(moveToListView))
        navigationItem.rightBarButtonItem = listButton
        mapView.delegate = self
        startZoomAnimation()
        self.presenter?.retrieveNearFoodTrucks()
    }
    
    func centerMapOnLocation(location: CLLocationCoordinate2D) {
        let coordinateRegion = MKCoordinateRegion(
            center: location,
            latitudinalMeters: currentRegionRadius,
            longitudinalMeters: currentRegionRadius
        )
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func startZoomAnimation() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(animateZoom), userInfo: nil, repeats: true)
    }
    
    @objc func animateZoom() {
        currentRegionRadius += 500
        if currentRegionRadius > 5000 {
            timer?.invalidate()
        }
        centerMapOnLocation(location: sanFranciscoCoordinates)
    }
    
    @objc func moveToListView() {
        self.presenter?.backToList()
    }
    
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        let identifier = "foodTruckAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
            annotationView!.tintColor = .orange
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let customAnnotation = view.annotation as? CustomMKAnnotation else {
            return
        }
        DispatchQueue.main.async { [weak self] in
            self?.titleLabel.text = customAnnotation.title ?? ""
            self?.streetLabel.text = customAnnotation.subtitle ?? ""
            self?.descriptionLabel.text = customAnnotation.foodTruckDescription ?? ""
            self?.hourOpenLabel.text = " \(customAnnotation.starHour ?? "") AM - \(customAnnotation.endHour ?? "") PM"
        }
    }
    
}

extension MapViewController: MapPresenterToView {
    
    func setNearFoodTrucks(foodTrucksInfo: [FoodTruckModel]) {
        for truck in foodTrucksInfo {
            if let latitudeStr = truck.latitude, let longitudeStr = truck.longitude,
               let latitude = Double(latitudeStr), let longitude = Double(longitudeStr) {
                let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                let customAnnotation = CustomMKAnnotation( title: truck.applicant ?? "", subtitle: truck.location ?? "",coordinate: coordinate,
                                                           id: Int(truck.locationId ?? "") ?? 0, startHour: truck.start24 ?? "" ,endHour: truck.end24 ?? "",
                                                           foodTruckDescription: truck.locationdesc ?? "",dayOpen: truck.dayOfWeekStr ?? "" )
                mapView.addAnnotation(customAnnotation)
            }
        }
    }
    
    func onResponseError(error: String) {
        
    }
    
    
}
