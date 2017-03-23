//
//  RepositoryModule.swift
//  tastingnotes
//
//  Created by iellis on 15/03/2017.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import Cleanse


struct RepositoryModule : Cleanse.Module {

    static func configure<B:Binder>(binder:B) {
        binder
            .bind(StaticNotesRepository.self)
            .tagged(with: StaticNotes.self)
            .to(value:StaticNotesRepository())

    }
}
