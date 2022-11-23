//
//  ViewController.swift
//  MapIntegrationMyDemo
//
//  Created by apple on 12/11/22.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate ,CLLocationManagerDelegate
{
    @IBOutlet weak var placeField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    var locManager:CLLocationManager?
    override func viewDidLoad() {
        super.viewDidLoad()
             searchButton.layer.borderWidth = 2
             searchButton.layer.borderColor = UIColor.green.cgColor
              searchButton.circleCorner()
        
        mapView.delegate = self
        
        locManager = CLLocationManager()
        locManager?.delegate = self
        
        locManager?.requestAlwaysAuthorization()
        locManager?.requestWhenInUseAuthorization()
        locManager?.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
      {
          let lastLoc:CLLocation? = locations.last
          
          print(lastLoc)
          
          zoomAndCenter(loc: lastLoc!.coordinate)
          
      }
      

        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let selectedPointAnnotation = view.annotation as! MKPointAnnotation
               print("loc Selected - ", selectedPointAnnotation.title!)
        placeField.text = selectedPointAnnotation.title!
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let cord1 = MKPointAnnotation()
        
        cord1.title = "Lig"
        cord1.coordinate = CLLocationCoordinate2D(latitude: 22.739758, longitude: 75.881215)
        mapView.addAnnotation(cord1)
        zoomAndCenter(loc: cord1.coordinate)
        
        let cord2 = MKPointAnnotation()
        
        cord2.title = "Palasia"
        cord2.coordinate = CLLocationCoordinate2D(latitude: 22.728354, longitude: 75.883951)
        mapView.addAnnotation(cord2)
        zoomAndCenter(loc: cord2.coordinate)
        
        let cord3 = MKPointAnnotation()
        
        cord3.title = "Lig Gurudwara"
        cord3.coordinate = CLLocationCoordinate2D(latitude: 22.735615, longitude: 75.890270)
        mapView.addAnnotation(cord3)
        zoomAndCenter(loc: cord3.coordinate)
        
        let cord4 = MKPointAnnotation()
        cord4.title = "Saurabh's Place"
        cord4.coordinate = CLLocationCoordinate2D(latitude: 22.734109, longitude: 75.886268)
        mapView.addAnnotation(cord4)
        zoomAndCenter(loc: cord4.coordinate)
        

        
        
    }
    
    
    func zoomAndCenter(loc:CLLocationCoordinate2D){
        let MySelectedRegion = MKCoordinateRegion(center: loc, latitudinalMeters: 3000, longitudinalMeters: 3000)
        
        mapView.setRegion(MySelectedRegion, animated: true)
    }
    
    
    @IBAction func onActionSearch(_ sender: Any) {
        let searchText = placeField!.text!
        let geoCoder:CLGeocoder = CLGeocoder()
        geoCoder.geocodeAddressString(searchText)
        {
             
        (placemarks:[CLPlacemark]?,err:Error?)
            in
            print(err,placemarks)
            
            self.locManager?.stopUpdatingLocation()
            let myPlace:CLPlacemark = placemarks![0]
            self.zoomAndCenter(loc: myPlace.location!.coordinate)
            
        }

            
         
        
        
    }
    
    

}

extension UIView {
    func setBorder(width: CGFloat, color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}

extension UIView {
  func circleCorner() {
        superview?.layoutIfNeeded()
        setCorner(radius: frame.height / 2)
    }
}
extension UIView {
  func setCorner(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}
