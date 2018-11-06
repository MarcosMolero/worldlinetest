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
        mapView.delegate = self
        
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
        mapView.addAnnotations(annotations)
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        guard let annotation = annotation as? Artwork else { return nil }
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        // 4
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view

    }
    
}
