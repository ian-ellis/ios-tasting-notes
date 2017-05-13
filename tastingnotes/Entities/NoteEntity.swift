//
// Created by iellis on 5/03/2017.
// Copyright (c) 2017 IanEllis. All rights reserved.
//

import Foundation

class NoteEntity {
    
    private static let RANGE:ClosedRange = 0...100

    var name:String
    var notes:String
    
    let alcohol: RangeBoundValue<Int> = RangeBoundValue(RANGE,value:0)
    let darkFruit: RangeBoundValue<Int> = RangeBoundValue(RANGE,value:0)
    let citrusFruit: RangeBoundValue<Int> = RangeBoundValue(RANGE,value:0)
    let hopps: RangeBoundValue<Int> = RangeBoundValue(RANGE,value:0)
    let spice: RangeBoundValue<Int> = RangeBoundValue(RANGE,value:0)
    let herbs: RangeBoundValue<Int> = RangeBoundValue(RANGE,value:0)
    let malt: RangeBoundValue<Int> = RangeBoundValue(RANGE,value:0)
    let toffee: RangeBoundValue<Int> = RangeBoundValue(RANGE,value:0)
    let burnt: RangeBoundValue<Int> = RangeBoundValue(RANGE,value:0)
    let sweet: RangeBoundValue<Int> = RangeBoundValue(RANGE,value:0)
    let sour: RangeBoundValue<Int> = RangeBoundValue(RANGE,value:0)
    let bitter: RangeBoundValue<Int> = RangeBoundValue(RANGE,value:0)
    let dry: RangeBoundValue<Int> = RangeBoundValue(RANGE,value:0)
    let body: RangeBoundValue<Int> = RangeBoundValue(RANGE,value:0)
    let linger: RangeBoundValue<Int> = RangeBoundValue(RANGE,value:0)
    
    init(name:String, notes:String){
        self.name = name
        self.notes = notes
    }
    
}
