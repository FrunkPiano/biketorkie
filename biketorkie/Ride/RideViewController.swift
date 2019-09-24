//
//  RideViewController.swift
//  biketorkie
//
//  Created by wangweiwei on 9/17/19.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit

class RideViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var currentLocation: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var coordinateArray = [CLLocationCoordinate2D]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.mainRed()
        
        let attributeDict = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22)]
        self.navigationController?.navigationBar.titleTextAttributes = attributeDict
        
        // 实例化定位管理器
        locationManager.delegate = self
        // 判断系统定位服务是否开启
        if !CLLocationManager.locationServicesEnabled() {
            print("未开启定位")
        } else {
            if CLLocationManager.authorizationStatus() == .denied {// 没有授权
                locationManager.requestWhenInUseAuthorization()
                locationManager.startUpdatingLocation()
            } else if (CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways) {
                locationManager.startUpdatingLocation()
            } else {
                locationManager.requestWhenInUseAuthorization()
                print("请检查定位权限")
            }
        }
        // 初始化地图
        mapView.userTrackingMode = .follow
    }
    
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        // 只要用户位置改变就调用此方法（包括第一次定位到用户位置），userLocation：是对用来显示用户位置的蓝色大头针的封装

        // 反地理编码
        let coder = CLGeocoder.init()
        coder.reverseGeocodeLocation(userLocation.location!) { (placemarks, error) in
            if let placemark = placemarks?[0],
                let fare = placemark.thoroughfare,
                let locality = placemark.locality,
                let country = placemark.country {
                
                self.currentLocation.text = "\(fare),\(locality),\(country)"
                // 设置用户位置蓝色大头针的标题
                userLocation.title = "当前位置:\(fare)\(locality)\(country)"
            }
        }

        // 设置用户位置蓝色大头针的副标题
        userLocation.subtitle = "经纬度(\(userLocation.location?.coordinate.longitude),\(userLocation.coordinate.latitude))"
        if let coordinate = userLocation.location?.coordinate {
            self.coordinateArray.append(coordinate)
            updatePath()
        }
        
        
    }
    
    func updatePath () {
        
        // 每次获取到新的定位点重新绘制路径
        
        // 移除掉除之前的overlay
        let overlays = self.mapView.overlays
        self.mapView.removeOverlays(overlays)
        
        let polyline = MKPolyline(coordinates: &self.coordinateArray, count: self.coordinateArray.count)
        mapView.addOverlay(polyline)
        
        // 将最新的点定位到界面正中间显示
        let lastCoord = self.coordinateArray[self.coordinateArray.count - 1]
        mapView.centerCoordinate = lastCoord
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let polyline = overlay as! MKPolyline
        let renderer = MKPolylineRenderer(polyline: polyline)
        renderer.strokeColor = #colorLiteral(red: 1, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        renderer.lineWidth = 5
        return renderer
    }
//    func mapView(_ mapView: MKMapView, viewFor overlay: MKOverlay) -> MKOverlayView {
//
//    }
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        
    }

    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
    }
}
