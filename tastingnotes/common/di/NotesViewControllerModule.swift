//
//  NotesViewControllerComponent.swift
//  tastingnotes
//
//  Created by iellis on 12/03/2017.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import UIKit
import Cleanse

extension NotesViewController {
    /// Configures NotesViewController
    
    struct Module : Cleanse.Module {
        static func configure<B:Binder>(binder: B) {
            // Configures the NotesViewController to be provided by the initializer
            binder
                .bind()
                .to(factory: NotesViewController.init)
            
            binder
                .bind()
                .to(factory:NotesViewModel.init)
            
            binder
                .bind(StaticNotesRepository.self)
                .tagged(with: StaticNotes.self)
                .to(value:StaticNotesRepository())
            
            
            // This satisfies UIWindow depending on TaggedProvider<UIViewController.Root>
            // The actual root is our RootViewController wrapped in a UINavigationController
            binder
                .bind()
                .tagged(with: UIViewController.Root.self)
                .to { UINavigationController(rootViewController: $0 as NotesViewController) }
        }
    }
}