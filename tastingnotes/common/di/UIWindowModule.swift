//
//  UIWindowModule.swift
//  tastingnotes
//
//  Created by iellis on 12/03/2017.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import UIKit
import Cleanse

extension UIWindow {
    struct Module : Cleanse.Module {
        
        static func configure<B:Binder>(binder: B) {

            binder
                .bind(UIWindow.self)
                .asSingleton()
                .to { (rootViewController: TaggedProvider<UIViewController.Root>) in
                    let window = UIWindow(frame: UIScreen.main.bounds)
                    window.rootViewController = rootViewController.get()
                    return window
            }
        }
    }
}
