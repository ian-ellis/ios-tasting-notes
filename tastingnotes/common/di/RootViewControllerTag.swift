//
//  RootViewControllerTag.swift
//  tastingnotes
//
//  Created by iellis on 12/03/2017.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import UIKit
import Cleanse

extension UIViewController {
    /// This will represent the rootViewController that is assigned to our main window
    public struct Root : Tag {
        public typealias Element = UIViewController
    }
}

