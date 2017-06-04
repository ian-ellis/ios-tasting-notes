//
//  NoteDetailsView.swift
//  tastingnotes
//
//  Created by iellis on 13/5/17.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import UIKit

class NoteDetailsView : UIView, Presentable {

    @IBOutlet weak var content: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    func get() -> UIView {
        return self
    }
    
    
}

