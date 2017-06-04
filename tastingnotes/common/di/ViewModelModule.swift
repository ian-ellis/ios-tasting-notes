//
//  ViewModleModule.swift
//  tastingnotes
//
//  Created by iellis on 13/03/2017.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import Cleanse

struct ViewModelModule : Cleanse.Module {

    static func configure<B:Binder>(binder: B) {
       
        binder.bind(NotesViewModel.self)
        .to(factory: NotesViewModel.init)
        
        binder.bind(NoteDetailsViewModel.self)
            .to(factory: NoteDetailsViewModel.init)
    }
}
