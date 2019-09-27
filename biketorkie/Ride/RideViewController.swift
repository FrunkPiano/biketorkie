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
        self.navigationController?.navigationBar.barTintColor = UIColor.mainRed()
        
        let attributeDict = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22)]
        self.navigationController?.navigationBar.titleTextAttributes = attributeDict
        
        searchBar.delegate = self
        let tapGest = UITapGestureRecognizer()
        tapGest.numberOfTouchesRequired = 1
        tapGest.numberOfTapsRequired = 1
        tapGest.addTarget(self, action: #selector(closeKeyboard))
        self.view.addGestureRecognizer(tapGest)
        
        manager = CLLocationManager()
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        manager?.activityType = .fitness
        checkLocationAuthStatus()
        
        manager?.startUpdatingLocation()
    }
    
    @objc func closeKeyboard() {
        searchBar.resignFirstResponder()
    }
    override func viewWillAppear(_ animated: Bool) {
        manager?.delegate = self
        mapView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        centerMapOnUserLocation()
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
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//            let location = locations.last
            if let location = locations.last {
//                let coordinate = location.coordinate
                
                let der = CLGeocoder()
                der.reverseGeocodeLocation(location) { (placemarks, error) in
                    if let plk = placemarks?[0],
                        let locality = plk.locality,
                        let fare = plk.thoroughfare,
                        let name = plk.name {
                        self.currentLocation.text = "\(locality),\(fare)\(name)"
                    }
                }
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

extension RideViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        let searchResultVC = UIViewController()
//        self.navigationController?.pushViewController(searchResultVC, animated: true)
        
         //初始化一个点注释对象
        let result1 = Artwork(title: "Jack", locationName: "", discipline: "discipline", coordinate: CLLocationCoordinate2D(latitude: 33.5, longitude: 150.53))
        mapView.addAnnotation(result1)
        
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

