//
//  LoadingTableView.swift
//  tastingnotes
//
//  Created by iellis on 15/03/2017.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import UIKit

protocol LoadingTableView : Presentable {
    weak var loadingIndicator: UIActivityIndicatorView! {get set}
    weak var table: UITableView! {get set}
    
}


