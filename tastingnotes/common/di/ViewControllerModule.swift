//
//  ViewControllerModule.swift
//  tastingnotes
//
//  Created by iellis on 15/03/2017.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import UIKit
import Cleanse

struct ViewControllerModule : Cleanse.Module {
    
    static func configure<B:Binder>(binder: B) {
        binder.bind(UIViewController.self)
            .tagged(with: UIViewController.Root.self)
            .to(factory: NotesViewController.init)
    }
}
