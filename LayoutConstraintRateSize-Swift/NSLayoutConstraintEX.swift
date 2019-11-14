//
//  NSLayoutConstraintEX.swift
//  LayoutConstraintRateSize-Swift
//
//  Created by gavin on 2019/11/14.
//  Copyright © 2019 gavin. All rights reserved.
//

import Foundation
import UIKit


extension NSLayoutConstraint{
    static let _rate = UIScreen.main.bounds.size.width / 375
    
    
    private struct AdaptiveKey {
        static var NSLAYOUTCONSTRAINT_ADAPTIVE_KEY: String = "NSLAYOUTCONSTRAINT_ADAPTIVE_KEY"
    }
    
    
    @IBInspectable
    public var adaptive: Bool {
        set {
            if newValue {
                let _cons_old = self.constant
                let _cons_new = _cons_old * NSLayoutConstraint._rate
                self.constant = _cons_new
            }
            
            objc_setAssociatedObject(self, &AdaptiveKey.NSLAYOUTCONSTRAINT_ADAPTIVE_KEY, self.constant, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
        get {
            return (objc_getAssociatedObject(self, &AdaptiveKey.NSLAYOUTCONSTRAINT_ADAPTIVE_KEY) != nil)
        }
    }
    
}
