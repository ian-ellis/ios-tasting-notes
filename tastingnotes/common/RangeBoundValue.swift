//
//  RangeBoundValue.swift
//  tastingnotes
//
//  Created by iellis on 13/5/17.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation


class RangeBoundValue<T:Comparable> {
    
    private let range:ClosedRange<T>
    private var _value:T
    
    var value:T {
        get {return _value}
        set {_value = range.bind(newValue)}
    }
    
    init(_ range:ClosedRange<T>, value:T) {
        self.range = range
        self._value = value
    }
}
