//
//  NotesView.swift
//  tastingnotes
//
//  Created by iellis on 15/03/2017.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import UIKit

class NotesView : UIView, LoadingTableView {

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var label: UILabel!
    
    func get() -> UIView {
        return self
    }
    
}
