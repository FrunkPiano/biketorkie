//
//  RideTableViewController.swift
//  biketorkie
//
//  Created by jie on 2019/8/23.
//  Copyright © 2019 jie. All rights reserved.
//

import Foundation
import UIKit
struct Headline {
    
    var id : Int
    var title : String
    var text : String
    var image : String
    
}
class RideTableViewController: UITableViewController {
    var headlines = [
        Headline(id: 1, title: "List Group Item Heading", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", image: "Apple"),
        Headline(id: 2, title: "List Group Item Heading", text: "Ut eget massa erat. Morbi mauris diam, vulputate at luctus non.", image: "Banana"),
        Headline(id: 3, title: "List Group Item Heading", text: "Aliquam egestas ultricies dapibus. Nam molestie nunc.", image: "Cantaloupe"),
        Headline(id: 4, title: "List Group Item Heading", text: "Aliquam egestas ultricies dapibus. Nam molestie nunc.", image: "Cantaloupe"),
        Headline(id: 5, title: "List Group Item Heading", text: "Aliquam egestas ultricies dapibus. Nam molestie nunc.", image: "Cantaloupe"),
        Headline(id: 6, title: "List Group Item Heading", text: "Aliquam egestas ultricies dapibus. Nam molestie nunc.", image: "Cantaloupe"),
    ]
    var cellColors = ["F28044","F0A761","FEC362","F0BB4C","E3CB92","FEA375"]
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlines.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        cell.textLabel?.text = headlines[indexPath.row].title
        cell.detailTextLabel?.text=headlines[indexPath.row].text
        cell.backgroundColor = .random()
        
        return cell
    }

   
}
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
