//
//  RideViewController.swift
//  biketorkie
//
//  Created by wangweiwei on 9/17/19.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit

class RideViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var currentLocation: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    var coordinateArray = [CLLocationCoordinate2D]()
    var manager: CLLocationManager?
    var updatingLocation = false
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CLLocationManager()
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        manager?.activityType = .fitness
        checkLocationAuthStatus()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        manager?.delegate = self
        mapView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        centerMapOnUserLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
        
        
        
    func checkLocationAuthStatus() {
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            manager?.requestWhenInUseAuthorization()
        }
    }

    
    func centerMapOnUserLocation() {
        mapView.userTrackingMode = .follow
        let coordinateRegion = MKCoordinateRegion.init(center: mapView.userLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(coordinateRegion, animated: true)
    }
        
     func updatePath () {
        
        // 每次获取到新的定位点重新绘制路径
        
        // 移除掉除之前的overlay
        let overlays = self.mapView.overlays
        self.mapView.removeOverlays(overlays)
        
        let polyline = MKPolyline(coordinates: &self.coordinateArray, count: self.coordinateArray.count)
        self.mapView.addOverlay(polyline)
        
        // 将最新的点定位到界面正中间显示
        let lastCoord = self.coordinateArray[self.coordinateArray.count - 1]
        self.mapView.setCenter(lastCoord, animated: true)
    }
    
    @IBAction func startRiding(_ sender: Any) {
        let btn = sender as! UIButton
        btn.isSelected = !btn.isSelected
        if btn.isSelected {// 开始
            updatingLocation = true
            manager?.startUpdatingLocation()
        }else {// 停止
            updatingLocation = false
            manager?.stopUpdatingLocation()
        }
    }
    
    @IBAction func recentActivity(_ sender: Any) {
    }
    
}

    extension RideViewController: CLLocationManagerDelegate{

        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            if status == .authorizedWhenInUse {
                checkLocationAuthStatus()
                mapView.showsUserLocation = true
            }
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let polyline = overlay as! MKPolyline
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = #colorLiteral(red: 1, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
            renderer.lineWidth = 5
            return renderer
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            if updatingLocation {
                // 获取新的定位数据
                let coordinate = userLocation.coordinate
                
                // 添加到保存定位点的数组
                self.coordinateArray.append(coordinate)
               
                updatePath()
            }
        }
    }



    class Artwork: NSObject, MKAnnotation {
        let title: String?
        let locationName: String
        let discipline: String
        let coordinate: CLLocationCoordinate2D
        
        init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
            self.title = title
            self.locationName = locationName
            self.discipline = discipline
            self.coordinate = coordinate
            
            super.init()
        }
        
        var subtitle: String? {
            return locationName
        }
    }

