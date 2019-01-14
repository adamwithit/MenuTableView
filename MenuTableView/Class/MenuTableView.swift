//
//  MenuTableView.swift
//  MenuTableView
//
//  Created by Don Chu on 14/1/2019.
//  Copyright © 2019 Don Chu. All rights reserved.
//

import UIKit

class MenuTableView: UIView {

    private var mainTableView:UITableView!
    private var sections : [MenuSection] = []
    override func awakeFromNib() {
        mainTableView = UITableView.init(frame: self.frame)
        self.addSubview(mainTableView)
        setupTableView()
    }
    
    func setupTableView(){
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib(nibName: "labelandimgCell", bundle: nil), forCellReuseIdentifier: "labelandimg")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private func getCell(indexPath:IndexPath) -> MenuCell{
        return sections[indexPath.section].cells[indexPath.row]
    }

}

class  MenuSection {
    private var cells: [MenuCell] = []
    
    
}

class  MenuCell {
    var title:String = ""
    var img :UIImage!
    
    
}

extension MenuTableView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelandimg") as! LabelAndImgTableViewCell
        cell.cellImg.image = getCell(indexPath: indexPath).img
        
        cell.cellTitleLB.text = getCell(indexPath: indexPath).title
        return cell
    }
    
    
}
