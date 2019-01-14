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
    private var sections : [MenuSection]
    override func awakeFromNib() {
        mainTableView = UITableView.init(frame: self.frame)
        self.addSubview(mainTableView)
        setupTableView()
    }
    
    func setupTableView(){
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

class  MenuSection {
    private var section: [MenuCell] = []
}

class  MenuCell {
    private var title:String = ""
    private var img :UIImage!
}

extension MenuTableView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
