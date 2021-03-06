//
//  MainViewController+MapView.swift
//  worldlinetest
//
//  Created by Marcos Molero on 06/11/2018.
//  Copyright © 2018 Marcos Molero. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension MainViewController: MKMapViewDelegate {
    
    func setupMap() {
        
        let initialLocation = CLLocation(latitude: 41.3922500, longitude: 2.1648800)
        centerMapOnLocation(location: initialLocation)
    }
    
    
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 10000

        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func displayOnMap() {
        let annotations = displayPointsOI.map { location -> MKAnnotation in
            let annotation = MKPointAnnotation()
            annotation.title = location.title
            annotation.coordinate = CLLocationCoordinate2D(latitude: Double(location.latitude)!, longitude: Double(location.longitude)!)
            return annotation
        }
        DispatchQueue.main.async {
            self.mapView.addAnnotations(annotations)
        }
        hideHUD()
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        guard let title = view.annotation?.title, let latitude = view.annotation?.coordinate.latitude.description, let longitude = view.annotation?.coordinate.longitude.description else { return }
        
        for item in displayPointsOI {
            if item.title == title && item.latitude == latitude && item.longitude == longitude {
                
                let selectedPointOI = PointOI(id: item.id, title: item.title, address: nil, transport: nil, email: nil, latitude: item.latitude, longitude: item.longitude, description: nil, phone: nil)
                
                let request = MainScene.SavePointOIToDataStore.Request(pointOI: selectedPointOI)
                interactor?.savePointOIToDataStore(request: request)
                router?.routeToDetail()
                
            }
        }
        
    }
}
