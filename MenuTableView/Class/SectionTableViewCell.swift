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
    
    func showNextSection(){
        let perentView = self.tableView
        if perentView != nil && perentView?.showSectionNum ?? 0 < perentView?.sections.count ?? 0{
            
            perentView?.showSectionNum += 1
            perentView?.mainTableView.reloadData()
        }
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
        if cells[indexPath.row].callBackFunc != nil && cells[indexPath.row].callBackFunc!() {
            showNextSection()
        }
        
    }
    
}
