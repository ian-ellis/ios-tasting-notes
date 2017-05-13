//
//  RangeExtension.swift
//  tastingnotes
//
//  Created by iellis on 13/5/17.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation


extension ClosedRange {
    
    func bind(_ val:Bound) -> Bound {
       
        if(self.contains(val)){
            return val
        }
        
        if(self.lowerBound > val){
            return self.lowerBound
        }
        
        return self.upperBound
    }
    
    
    
}
