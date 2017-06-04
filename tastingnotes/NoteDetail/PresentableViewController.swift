//
//  PresentableViewController.swift
//  tastingnotes
//
//  Created by iellis on 3/6/17.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import UIKit

class PresentableViewController :UIViewController {
    
    var presenter:ViewControllerRoot?
    
    override func viewDidLayoutSubviews() {
        presenter?.viewDidLayoutSubviews()
    }
}
