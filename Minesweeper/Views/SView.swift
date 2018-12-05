//
//  SView.swift

//
//  Created by sondang on 10/3/18.
//  Copyright © 2018 sondang. All rights reserved.
//

import UIKit

class SView: UIView {
    
    @IBOutlet var contentView: UIView!
    var refreshControl: UIRefreshControl?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addContentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInt()
    }
    
    convenience init(viewFrame: CGRect) {
        self.init(frame: viewFrame)
        
        commonInt()
    }
    
    convenience init(frameForNoti: CGRect) {
        self.init(frame: frameForNoti)
    }
    
    func commonInt() {
        Bundle.main.loadNibNamed(nibName(), owner:self, options: nil)
        addSubview(contentView)
        
        contentView.frame = self.bounds;
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    // MARK: - functional
    public func nibName() -> String {
        return self.className
    }
    
    func addToWindow() {
        let windows = UIApplication.shared.keyWindow!
        self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        windows.addSubview(self)
        windows.bringSubviewToFront(self)
    }
    
    func addContentView() {
        contentView = UINib.init(nibName: nibName(), bundle: nil).instantiate(withOwner: self, options: nil).last as! UIView
        contentView.frame = self.frame
        
        self.addSubview(contentView)
        self.addToWindow()
    }
    
}
