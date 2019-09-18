//
//  ViewController.swift
//  biketorkie
//
//  Created by jie on 2019/8/19.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //定义渐变的颜色（从黄色渐变到橙色）
        let topColor = UIColor.black
        let buttomColor = UIColor.red
        let gradientColors = [topColor.cgColor, buttomColor.cgColor]
         
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
         
        //创建CAGradientLayer对象并设置参数
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
         
        //设置其CAGradientLayer对象的frame，并插入view的layer
        gradientLayer.frame = self.view.frame
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        // Do any additional setup after loading the view.
    }


}

