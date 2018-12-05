//
//  FieldModel.swift
//  Minesweeper
//
//  Created by sondang on 12/5/18.
//  Copyright © 2018 sondang. All rights reserved.
//

import UIKit

class FieldModel: SObject {

    public var coordinateX: Int = 0
    public var coordinateY: Int = 0
    public var isSweep: Bool = false
    
    public var hasMine: Bool = false
    public var mineNearBy: Int { return numberOfMineNearBy }
    
    private var numberOfMineNearBy: Int = 0
    
    init(withCoordinate coordinate: CGPoint, hasMine: Bool) {
        self.hasMine = hasMine
        coordinateX = Int(coordinate.x)
        coordinateY = Int(coordinate.y)
        if hasMine {
            numberOfMineNearBy = 9
        }
    }
    
    public func addMineNearBy(mine: Int) {
        if numberOfMineNearBy != 9 {
            numberOfMineNearBy = mine
        }
    }
    
    public func addMine(_ forced: Bool) -> Bool {
        if forced {
            hasMine = true
            numberOfMineNearBy = 9
            return true
        }
        
        return false
    }
    
}
