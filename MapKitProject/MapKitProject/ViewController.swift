//
//  ViewController.swift
//  MapKitProject
//
//  Created by Serhat on 1.08.2023.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let konum = CLLocationCoordinate2D(latitude: 39.939107, longitude: 32.8468892)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let bolge = MKCoordinateRegion(center: konum, span: span)
        mapView.setRegion(bolge, animated: true)
        let pin = MKPointAnnotation()
        pin.coordinate = konum
        pin.title = "ANKARA"
        pin.subtitle = "Alt Başlık"
        mapView.addAnnotation(pin)
    }
}

