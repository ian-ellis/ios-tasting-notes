//
//  UIViewExtension.swift
//  tastingnotes
//
//  Created by iellis on 15/03/2017.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    class func instantiateFromNib() -> Self? {
        
        func instanceFromNib<T: UIView>() ->T? {
            
            return nib.instantiate() as? T
        }
        
        return instanceFromNib()
    }
}

extension UIView {
    
    static var nib: UINib {
        
        let xib =  UINib(nibName: "\(self)", bundle: nil)
        return xib
    }
}

extension UINib {
    
    func instantiate() -> Any? {
        
        return self.instantiate(withOwner: nil, options: nil).first
    }
}
