//
//  MenuTableView.swift
//  MenuTableView
//
//  Created by Don Chu on 14/1/2019.
//  Copyright © 2019 Don Chu. All rights reserved.
//

import UIKit

public class MenuTableView: UIView {

    var mainTableView:UITableView!
    open var sections : [MenuSection] = []
    var showSectionNum = 1
    override public func awakeFromNib() {
        mainTableView = UITableView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: self.frame.size))
        self.addSubview(mainTableView)
        setupTableView()
    }
    
    func setupTableView(){
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib.init(nibName: "SectionTableViewCell", bundle: nil), forCellReuseIdentifier: "sectionCell")
        mainTableView.separatorStyle = .none
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    public func add(section:MenuSection){
        sections.append(section)
    }
    
    public func remove(sectionFromIndex:Int){
        if sections.count > sectionFromIndex{
            sections.removeSubrange(sectionFromIndex...)
            showSectionNum = sections.count
            mainTableView.reloadData()
        }
        
    }
    public func reloadData(){
        mainTableView.reloadData()
    }
    
    public func getTableHeight() -> Float{
        return Float(showSectionNum * (120 + 45))
    }

}

public class  MenuSection : NSObject{
    var cells: [MenuCell] = []
    var title: String = ""
    
    public init(cells:[MenuCell],title:String) {
        self.cells = cells
        self.title = title
    }
    
}

public class  MenuCell: NSObject {
    var title:String = ""
    var img :UIImage!
    var callBackFunc: (() -> Bool)? = nil
    
    public init(title:String,img:UIImage,callBackFunc: (() -> Bool)?) {
        self.img = img
        self.title = title
        if (callBackFunc != nil){
            self.callBackFunc = callBackFunc
        }
    }
}

extension MenuTableView:UITableViewDelegate,UITableViewDataSource{
    public func numberOfSections(in tableView: UITableView) -> Int {
        return showSectionNum
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell") as! SectionTableViewCell
        cell.cells = sections[indexPath.section].cells
        cell.backgroundColor = .black
        return cell
        
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let thatSection = sections[section]
        return thatSection.title
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    
}

extension UITableViewCell {
    var tableView: MenuTableView? {
        var view = self.superview
        while (view != nil && view!.isKind(of: MenuTableView.self) == false) {
            view = view!.superview
        }
        return view as? MenuTableView
    }
}
