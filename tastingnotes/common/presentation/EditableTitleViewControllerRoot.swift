//
//  EditableRootViewControllerRoot.swift
//  tastingnotes
//
//  Created by iellis on 13/5/17.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import UIKit

protocol EditableTitleViewControllerRoot : ViewControllerRoot {
    func getTitleView() -> UIView
}
