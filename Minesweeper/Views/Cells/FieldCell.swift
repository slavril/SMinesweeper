//
//  FieldCell.swift
//  Minesweeper
//
//  Created by sondang on 12/5/18.
//  Copyright © 2018 sondang. All rights reserved.
//

import UIKit

class FieldCell: UICollectionViewCell {
    
    var field: FieldModel!
    @IBOutlet private weak var mineLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func update(with field: FieldModel) {
        self.field = field
        if field.isSweep {
            mineLabel.text = "\(field.mineNearBy)"
            if field.hasMine {
                mineLabel.text = "X"
            }
        }
    }
}
