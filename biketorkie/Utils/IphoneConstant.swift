//
//  IphoneConstant.swift
//  SohuAuto
//
//  Created by ericwang on 2018/3/6.
//  Copyright © 2018年 WuJason. All rights reserved.
//

import Foundation

/// 不同机型的判定以及常量显示
@objc class IphoneConstant: NSObject {

    /// 判断是否为iphoneX
    
    static var isIphoneXSerise: Bool  {
        return  Int((UIScreen.mainHeight / UIScreen.mainWidth * 100)) == 216
    }
    
    static var isIphoneX: Bool {
        return UIScreen.mainHeight == 812.0
    }
    
    static var isIphoneXR: Bool {
        return false
    }
    
    static var isIphoneXS: Bool {
        return UIScreen.mainHeight == 812.0
    }
    
    static var isIphoneXSMax: Bool {
        return UIScreen.mainHeight == 896.0
    }

    /// 导航栏高度
   @objc static var heightNavigateBar: CGFloat {
        return isIphoneXSerise ? 88 : 64
    }

   @objc  static var heightNavigateBarWithoutStatus: CGFloat {
        return 44
    }

    /// 状态栏高度
   @objc static var heightStatusBar: CGFloat {
        return isIphoneXSerise ? 44 : 20
    }

    /// tab栏高度
  @objc  static var heightTabBar: CGFloat {
        return isIphoneXSerise ? 83 : 49
    }
    // feed流字体
  @objc  static var titileFont: UIFont {
        return UIFont(name: "PingFangSC-Medium", size: 17) ?? UIFont.systemFont(ofSize: 17)
    }
    //微头条字体
  @objc  static var microTitleFont: UIFont {
        return UIFont(name: "PingFangSC-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16)
    }
}
