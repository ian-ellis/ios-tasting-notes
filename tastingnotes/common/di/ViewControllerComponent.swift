//
//  ViewControllerComponent.swift
//  tastingnotes
//
//  Created by iellis on 3/04/2017.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import Cleanse

protocol ViewControllerComponent : Cleanse.Component {
    typealias Seed = TaggedProvider<ViewControllerID>
}
extension ViewControllerComponent {
    
    static func configure<B:Binder>(binder: B) {
        
        binder.include(module: ViewControllerModule.self)
        binder.include(module: ViewModelModule.self)
        binder.include(module: ViewModule.self)
        binder.include(module: PresenterModule.self)
    }
    
}

