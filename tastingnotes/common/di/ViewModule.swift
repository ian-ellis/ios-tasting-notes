//
//  ViewModule.swift
//  tastingnotes
//
//  Created by iellis on 15/03/2017.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import Cleanse

struct ViewModule : Cleanse.Module {
    static func configure<B:Binder>(binder: B) {
        binder
            .bind(LoadingTableView.self)
            .tagged(with: LoadingTable.self)
            .to { NotesView.instantiateFromNib() as NotesView!}
        
    }
}
