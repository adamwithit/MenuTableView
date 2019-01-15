//
//  SectionTableViewCell.swift
//  MenuTableView
//
//  Created by Don Chu on 15/1/2019.
//  Copyright © 2019 Don Chu. All rights reserved.
//

import UIKit

class SectionTableViewCell: UITableViewCell {
    @IBOutlet weak var sectionCV: UICollectionView!
    var cells :[MenuCell] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        sectionCV.delegate = self
        sectionCV.dataSource = self
        sectionCV.register(UINib.init(nibName: "labelandimgCell", bundle: nil), forCellWithReuseIdentifier: "labelAndImgCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension SectionTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "labelAndImgCell", for: indexPath) as! LabelAndImgTableViewCell
        cell.cellImg.image = cells[indexPath.row].img
        
        cell.cellTitleLB.text = cells[indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.tableView != nil && self.tableView?.showSectionNum ?? 0 < self.tableView?.sections.count ?? 0{
            
            self.tableView?.showSectionNum += 1
            self.tableView?.mainTableView.reloadData()
        }
        
    }
    
}
