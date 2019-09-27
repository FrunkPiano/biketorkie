//
//  EventsViewController.swift
//  biketorkie
//
//  Created by wangweiwei on 9/18/19.
//  Copyright © 2019 jie. All rights reserved.
//

import UIKit
let NavH:CGFloat = UIScreen.main.bounds.height == 812 ? 84 : 64
class EventsViewController: UIViewController {
    var pageView: YCPageView!
    @IBOutlet weak var searchBar: UISearchBar!
    private var pageCollectionView :YCPageCollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.mainRed()
        
        let attributeDict = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22)]
        self.navigationController?.navigationBar.titleTextAttributes = attributeDict
        
        let tapGest = UITapGestureRecognizer()
        tapGest.numberOfTouchesRequired = 1
        tapGest.numberOfTapsRequired = 1
        tapGest.addTarget(self, action: #selector(closeKeyboard))
        self.view.addGestureRecognizer(tapGest)
        
        // 标题
        let titles = ["Discovery", "Hosting", "Plan"]
        
        //样式
        let style = YCTitleStyle()
        //可以滚动
        style.isScrollEnable = false
        //显示底部滚动条
        style.isShowBottomLine = true
        //进行缩放
        style.isNeedScale = true
        //显示遮盖
        style.isShowCover = true
        
        // 子控制器
        var childVCs = [DiscoveryViewController(), HostingViewController()]
        var planVC =  PlanViewController()
        planVC.clickClosure =  {(date) in
            self.pageView.selectTab(index: 0)
            print(date)
        }
        childVCs.append(planVC)
//        for _ in 0..<titles.count {
//            let vc = UIViewController()
//            vc.view.backgroundColor = UIColor.randomColor()
//            childVcs.append(vc)
//        }
        
        // pageView的frame
        
        let pageFrame = CGRect(x: 0, y: IphoneConstant.heightNavigateBar + 64, width: view.bounds.width, height: view.bounds.height - IphoneConstant.heightNavigateBar - 64)
        
        // 创建YCPageView,并且添加到控制器的view中
        pageView = YCPageView(frame: pageFrame, titles: titles, childVcs: childVCs, parentVc: self, style : style)
        view.addSubview(pageView)
    }
    
    @objc func closeKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    @IBAction func viewNotifications(_ sender: Any) {
        let notifyVC = NotifyViewController()
        self.navigationController?.pushViewController(notifyVC, animated: true)
    }
    

}

extension EventsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let discover = DiscoveryViewController()
        discover.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(discover, animated: true)

    }
}

