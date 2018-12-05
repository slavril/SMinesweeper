//
//  MapModel.swift
//  Minesweeper
//
//  Created by sondang on 12/5/18.
//  Copyright © 2018 sondang. All rights reserved.
//

import UIKit

class MapModel: SObject {
    
    var rows: Int = 10
    var columns: Int = 10
    private var numberOfMines: Int = 5
    
    var fields: [String: FieldModel] = [String: FieldModel]()
    
    init(withNumberOfMine mines: Int, size: CGSize) {
        super.init()
        
        numberOfMines = mines
        rows = Int(size.height)
        columns = Int(size.width)
        
        createMineField()
    }
    
    private func createMineField() {
        var mineCount = 0
        for yIndex in 0...rows-1 {
            for xIndex in 0...columns-1 {
                var hasMine = false
                if mineCount < numberOfMines {
                    let random = Int.random(in: 0..<(rows*columns))
                    
                    if random <= numberOfMines {
                        mineCount += 1
                        hasMine = true
                    }
                }
                
                let field = FieldModel.init(withCoordinate: CGPoint.init(x: CGFloat(xIndex), y: CGFloat(yIndex)), hasMine: hasMine)
                
                fields["\(xIndex),\(yIndex)"] = field
            }
        }
        
        testFields()
    }
    
    private func updateMineFieldIndicator(of field: FieldModel) {
        // get field coordinate
        var mine = 0
        for X in field.coordinateX-1...field.coordinateX+1 {
            for Y in field.coordinateY-1...field.coordinateY+1 {
                if let nearbyField: FieldModel = fields["\(X),\(Y)"] {
                    if nearbyField.hasMine {
                        mine += 1
                    }
                }
            }
        }
        
        field.addMineNearBy(mine: mine)
    }
    
    private func testFields() {
        for yIndex in 0...rows-1 {
            var content = ""
            for xIndex in 0...columns-1 {
                if let field: FieldModel = fields["\(xIndex),\(yIndex)"] {
                    updateMineFieldIndicator(of: field)
                    content = content + "|\(field.mineNearBy)|"
                }
            }
            
            print("\(content) \n")
        }
    }
    func updateMineFieldIndicatorOf(_ indexPath: IndexPath) {
        if let field = getFieldOf(indexPath) {
            field.isSweep = true
            updateMineFieldIndicator(of: field)
        }
    }
    
    func getFieldOf(_ indexPath: IndexPath) -> FieldModel? {
        let x: Int = indexPath.row%columns
        let y: Int = indexPath.row/columns
        
        if let field = fields["\(x),\(y)"] {
            return field
        }
        
        return nil
    }
    
}
