//
//  ViewController.swift
//  MenuTableView
//
//  Created by Don Chu on 14/1/2019.
//  Copyright © 2019 Don Chu. All rights reserved.
//

import UIKit
import FontAwesome_swift

class ViewController: UIViewController {
    
    @IBOutlet weak var menuTable: MenuTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cell1InSection1 = MenuCell.init(title: "male", img: UIImage.fontAwesomeIcon(name:.male ,style:.solid, textColor:.black, size: CGSize.init(width: 30, height: 30)))
        let cell2InSection1 = MenuCell.init(title: "female", img: UIImage.fontAwesomeIcon(name:.female ,style:.solid, textColor:.black, size: CGSize.init(width: 30, height: 30)))
        let section1 = MenuSection.init(cells: [cell1InSection1,cell2InSection1], title: "Gender")
        menuTable.addSection(section: section1)
        let cell1InSection2 = MenuCell.init(title: "<18", img: UIImage.fontAwesomeIcon(name:.male ,style:.solid, textColor:.black, size: CGSize.init(width: 30, height: 30)))
        let cell2InSection2 = MenuCell.init(title: "18-30", img: UIImage.fontAwesomeIcon(name:.female ,style:.solid, textColor:.black, size: CGSize.init(width: 30, height: 30)))
        let cell3InSection2 = MenuCell.init(title: "30-50", img: UIImage.fontAwesomeIcon(name:.female ,style:.solid, textColor:.black, size: CGSize.init(width: 30, height: 30)))
        let cell4InSection2 = MenuCell.init(title: ">50", img: UIImage.fontAwesomeIcon(name:.female ,style:.solid, textColor:.black, size: CGSize.init(width: 30, height: 30)))
        let section2 = MenuSection.init(cells: [cell1InSection2,cell2InSection2,cell3InSection2,cell4InSection2], title: "Age")
        menuTable.addSection(section: section2)
        // Do any additional setup after loading the view, typically from a nib.
    }


}

