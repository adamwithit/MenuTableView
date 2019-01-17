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
        menuTable.setSectionBackgroundColor(color: .blue)
        menuTable.tableBackgroundColor = UIColor.black
        menuTable.setCellBackgroundColor(color: .orange)
        let cell1InSection1 = MenuCell.init(title: "male", img: UIImage.fontAwesomeIcon(name:.male ,style:.solid, textColor:.black, size: CGSize.init(width: 30, height: 30)),callBackFunc:{return true})
        let cell2InSection1 = MenuCell.init(title: "female", img: UIImage.fontAwesomeIcon(name:.female ,style:.solid, textColor:.black, size: CGSize.init(width: 30, height: 30)),callBackFunc:{return true})
        let section1 = MenuSection.init(cells: [cell1InSection1,cell2InSection1], title: "Gender")
        menuTable.add(section: section1)
        let cell1InSection2 = MenuCell.init(title: "<18", img: UIImage.fontAwesomeIcon(name:.male ,style:.solid, textColor:.black, size: CGSize.init(width: 30, height: 30)),callBackFunc:{
            if self.menuTable.sections.count > 2{
                self.menuTable.remove(sectionFromIndex: 2)
            }
            
            return false})
        let cell2InSection2 = MenuCell.init(title: "18-30", img: UIImage.fontAwesomeIcon(name:.female ,style:.solid, textColor:.black, size: CGSize.init(width: 30, height: 30)),callBackFunc:askForSmoke)
        let cell3InSection2 = MenuCell.init(title: "30-50", img: UIImage.fontAwesomeIcon(name:.female ,style:.solid, textColor:.black, size: CGSize.init(width: 30, height: 30)),callBackFunc:askForSmoke)
        let cell4InSection2 = MenuCell.init(title: ">50", img: UIImage.fontAwesomeIcon(name:.female ,style:.solid, textColor:.black, size: CGSize.init(width: 30, height: 30)),callBackFunc:askForSmoke)
        let section2 = MenuSection.init(cells: [cell1InSection2,cell2InSection2,cell3InSection2,cell4InSection2], title: "Age")
        menuTable.add(section: section2)
        // Do any additional setup after loading the view, typically from a nib.
    }

    func askForSmoke() -> Bool{
        
        let cell1InSection3 = MenuCell.init(title: "Yes, I smoke.", img: UIImage.fontAwesomeIcon(name:.smoking ,style:.solid, textColor:.black, size: CGSize.init(width: 30, height: 30)),callBackFunc:{return true})
        let cell2InSection3 = MenuCell.init(title: "No, I don't.", img: UIImage.fontAwesomeIcon(name:.smokingBan ,style:.solid, textColor:.black, size: CGSize.init(width: 30, height: 30)),callBackFunc:{return true})
       let section3 = MenuSection.init(cells: [cell1InSection3,cell2InSection3], title: "Smoke?")
        if menuTable.sections.count > 2 {
            menuTable.sections.remove(at: 2)
        }
        menuTable.add(section: section3)
        return true
    }
}

