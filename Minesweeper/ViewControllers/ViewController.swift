//
//  ViewController.swift
//  Minesweeper
//
//  Created by sondang on 12/5/18.
//  Copyright © 2018 sondang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var mapView: MapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mapView.setupWith(MapModel.init(withNumberOfMine: 6, size: CGSize.init(width: 4, height: 6)))
    }


}

