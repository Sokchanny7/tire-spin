//
//  ViewController.swift
//  Tire Spin
//
//  Created by sok channy on 2/10/17.
//  Copyright © 2017 channy-origin. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import GooglePlacePicker
import MapKit

class ViewController: UIViewController {
    
    var placesClient        : GMSPlacesClient!
    var markerDict          : [Int: GMSMarker] = [:]
    var mapView             : GMSMapView!
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var unavaliableView: UIView!
    
    @IBOutlet weak var avaliableMapView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.unavaliableView.removeFromSuperview()
        let camera  = GMSCameraPosition.camera(withLatitude: latlongDic[0].latitute, longitude: latlongDic[0].longtitute, zoom: 15)
        
        mapView     = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        //self.avaliableMapView = mapView
        //self.avaliableMapView.addSubview(mapView)
        //self.avaliableMapView.isHidden = false
        //mapView.isHidden = false
        
        //self.view = mapView
        
        self.unavaliableView = mapView
        
        
        for i in 0..<latlongDic.count {
            markerDict[i]           = GMSMarker()
            markerDict[i]?.position = CLLocationCoordinate2D(latitude: latlongDic[i].latitute, longitude: latlongDic[i].longtitute )
            markerDict[i]?.title    = latlongDic[i].title
            markerDict[i]?.snippet  = latlongDic[i].subTitle
            markerDict[i]?.map      = mapView
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func currentPlace() {
        let center      = CLLocationCoordinate2D(latitude: 37.788204, longitude: -122.411937)
        let northEast   = CLLocationCoordinate2D(latitude: center.latitude + 0.001, longitude: center.longitude + 0.001)
        let southWest   = CLLocationCoordinate2D(latitude: center.latitude - 0.001, longitude: center.longitude - 0.001)
        let viewport    = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        let config      = GMSPlacePickerConfig(viewport: viewport)
        let placePicker = GMSPlacePicker(config: config)
        
        placePicker.pickPlace(callback: {(place, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
//            if let place = place {
//                self.nameLabel.text = place.name
//                self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
//                    .joined(separator: "\n")
//            } else {
//                self.nameLabel.text = "No place selected"
//                self.addressLabel.text = ""
//            }
        })
    }
}

//extension ViewController : CLLocationManagerDelegate {
//    
//    @IBAction func locateMe(sender: UIBarButtonItem) {
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//        
//        mapView.showsUserLocation = true
//        
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let userLocation:CLLocation = locations[0] as CLLocation
//        manager.stopUpdatingLocation()
//        let coordinations = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude,longitude: userLocation.coordinate.longitude)
//        let camera = GMSCameraPosition.camera(withLatitude: coordinations.latitude, longitude: coordinations.longitude, zoom: 12)
//        
//        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        view        = mapView
//        
//        for i in 0...latlongDic.count {
//            markerDict[i]           = GMSMarker()
//            markerDict[i]?.position = CLLocationCoordinate2D(latitude: latlongDic[i].latitute, longitude: latlongDic[i].longtitute )
//            markerDict[i]?.title    = latlongDic[i].title
//            markerDict[i]?.snippet  = latlongDic[i].subTitle
//            markerDict[i]?.map      = mapView
//        }
//        
//        
//        //self.view = mapView
//        
//        
//        //let span = MKCoordinateSpanMake(0.2,0.2)
//        //let region = MKCoordinateRegion(center: coordinations, span: span)
//        
//        //mapView.setRegion(region, animated: true)
//        
//    }
//}

