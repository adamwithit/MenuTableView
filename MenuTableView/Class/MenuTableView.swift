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
    open var tableBackgroundColor : UIColor?{
        set{
            mainTableView.backgroundColor = newValue
        }
        get{
            return mainTableView.backgroundColor
        }
    }
    var sectionBackgroundColor = UIColor.white
    var cellBackgroundColor = UIColor.white
    var showSectionNum = 1
    override public func awakeFromNib() {
        mainTableView = UITableView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: self.frame.size))
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mainTableView)
        let horizontalConstraint = NSLayoutConstraint(item: mainTableView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([
            horizontalConstraint
            ])
        setupTableView()
    }
    
    func setupTableView(){
        mainTableView.delegate = self
        mainTableView.dataSource = self
        let podBundle = Bundle(for: MenuTableView.self)
        let nib = UINib.init(nibName: "SectionTableViewCell", bundle: podBundle)
        mainTableView.register(nib, forCellReuseIdentifier: "sectionCell")
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
            reloadData()
        }
        
    }
    
    public func setSectionBackgroundColor(color:UIColor){
        sectionBackgroundColor = color
        reloadData()
    }
    
    public func setCellBackgroundColor(color:UIColor){
        cellBackgroundColor = color
        reloadData()
    }
    public func reloadData(){
        mainTableView.reloadTable {
            self.mainTableView.frame = CGRect.init(origin: self.frame.origin, size: CGSize.init(width: self.frame.size.width, height: self.getTableHeight()))
            self.mainTableView.setNeedsLayout()
        }
    }
    
    public func getTableHeight() -> CGFloat{
        return CGFloat(showSectionNum * (120 + 28))
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
        if sections.count > 0 {
            return showSectionNum
        }else{
            return 0
        }
        
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
       
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell") as! SectionTableViewCell
        cell.cells = sections[indexPath.section].cells
        cell.backgroundColor = sectionBackgroundColor
        cell.cellBackgroundColor = cellBackgroundColor
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

extension UITableView {
    func reloadTable(completion: @escaping () -> ()) {
        UIView.animate(withDuration: 0, animations: { self.reloadData()})
        {_ in completion() }
    }
}
