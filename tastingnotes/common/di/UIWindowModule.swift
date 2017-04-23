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


struct UIWindowModule : Cleanse.Module {
    
    static func configure<B:Binder>(binder: B) {
        
        binder
            .bind(UIWindow.self)
            .asSingleton()
            .to {
                return  UIWindow(frame: UIScreen.main.bounds)
        }
        
        binder
            .bind(UINavigationController.self)
            .asSingleton()
            .to {
                return UINavigationController()
            }
    }
}

