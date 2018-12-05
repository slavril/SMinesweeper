//
//  MapView.swift
//  Minesweeper
//
//  Created by sondang on 12/5/18.
//  Copyright © 2018 sondang. All rights reserved.
//

import UIKit

class MapView: SView {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet private var collectionWidthConstraint: NSLayoutConstraint!
    @IBOutlet private var collectionHeightConstraint: NSLayoutConstraint!
    
    private var map: MapModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "FieldCell", bundle: nil), forCellWithReuseIdentifier: "fieldCell")
    }
    
    func setupWith(_ map: MapModel) {
        self.map = map
        collectionWidthConstraint.constant = ScreenSize.SCREEN_WIDTH - 32
        let theSize = collectionWidthConstraint.constant/CGFloat(map.columns)
        collectionHeightConstraint.constant = theSize * CGFloat(map.rows)
        collectionView.reloadData()
    }

}

extension MapView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return map.fields.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let fieldCell: FieldCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "fieldCell", for: indexPath) as! FieldCell
        if let field = map.getFieldOf(indexPath) {
            fieldCell.update(with: field)
        }
        
        return fieldCell
    }
    
}

extension MapView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let theSize = collectionWidthConstraint.constant/CGFloat(map.columns)
        
        return CGSize.init(width: theSize, height: theSize)
    }
    
}

extension MapView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        map.updateMineFieldIndicatorOf(indexPath)
        collectionView.reloadItems(at: [indexPath])
    }
    
}
