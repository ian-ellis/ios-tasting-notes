//
//  PresenterModule.swift
//  tastingnotes
//
//  Created by iellis on 13/03/2017.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import Cleanse

struct PresenterModule : Cleanse.Module {

    static func configure<B:Binder>(binder: B) {
        binder.bind(NotesPresenter.self)
            .to(factory: NotesPresenter.init)
        
    }
}
