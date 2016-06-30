//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by John Cook on 5/29/16.
//  Copyright © 2016 John Cook. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
    override func loadView() {
        // create a map view and set as the view of this view controller
        mapView = MKMapView()
        view = mapView
        mapView.delegate = self
        
        // add segmented control for map type
        let standardString  = NSLocalizedString("Standard", comment: "Standard map view")
        let hybridString    = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let segmentedControl = UISegmentedControl(items: [standardString, hybridString, satelliteString])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), forControlEvents: .ValueChanged)
        
        // add constraints
        let topConstraint       = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint  = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
     
        topConstraint.active       = true
        leadingConstraint.active  = true
        trailingConstraint.active = true
        
        // add zoom to location button
        let zoomButton = UIButton(type: UIButtonType.Custom) as UIButton
        zoomButton.frame = CGRectMake(275, 525, 100, 100)
        zoomButton.setImage(UIImage(named:"locationArrow.png"), forState: .Normal)
        zoomButton.addTarget(self, action: "btnTouched:", forControlEvents: .TouchUpInside)
        view.addSubview(zoomButton)
        let bottomConstraint = zoomButton.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.topAnchor)
        let rightConstraint  = zoomButton.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        bottomConstraint.active = true
        rightConstraint.active  = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("MapViewController loaded its view.")
    }
    
    /* Called each time the map view appears on screen */
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        //print("Map incoming")
    }
    
    func mapTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
        }
    }
    
    func btnTouched(sender: UIButton!) {
        // get current used lat and long, then zoom in on that point
//        var locationManager = CLLocationManager()
//        locationManager.requestWhenInUseAuthorization()
//        var currentLocation = CLLocation()
//        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse ||
//            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.Authorized) {
//            currentLocation = locationManager.location!
//        }
//        
//        
//        let latitude:CLLocationDegrees = currentLocation.coordinate.latitude
//        print(latitude)
//        let longitude:CLLocationDegrees = currentLocation.coordinate.longitude
//        print(longitude)
//        let latDelta:CLLocationDegrees = 0.05
//        let lonDelta:CLLocationDegrees = 0.05
//        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
//        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
//        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
//        
//        mapView.setRegion(region, animated: false)
    }
    

}
