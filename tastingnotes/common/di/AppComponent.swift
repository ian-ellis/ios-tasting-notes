//
// Created by iellis on 9/03/2017.
// Copyright (c) 2017 IanEllis. All rights reserved.
//

import Foundation
import Cleanse
import UIKit

struct AppRoot {
    let window: UIWindow
    let rootViewController:UIViewController
    let navigationController:UINavigationController
    let notesViewControllerComponentFactory: ComponentFactory<NotesViewControllerComponent>
    let noteDetailsViewControllerComponentFactory: ComponentFactory<NoteDetailsViewControllerComponent>
    
    
    init(window:UIWindow, navigationController:UINavigationController, rootViewController:TaggedProvider<UIViewController.Root>, notesViewControllerComponentFactory: ComponentFactory<NotesViewControllerComponent>,
        noteDetailsViewControllerComponentFactory: ComponentFactory<NoteDetailsViewControllerComponent>){
        self.window = window
        self.navigationController = navigationController
        self.rootViewController = rootViewController.get()
        self.notesViewControllerComponentFactory = notesViewControllerComponentFactory
        self.noteDetailsViewControllerComponentFactory = noteDetailsViewControllerComponentFactory
    }

}

struct AppComponent: Cleanse.RootComponent {
    typealias Root = AppRoot
    typealias Scope = Singleton

    static func configure<B:Binder>(binder: B) {
        
        binder.include(module: ViewControllerModule.self)
        binder.include(module: UIWindowModule.self)
        binder.include(module: RepositoryModule.self)

        binder.install(dependency: NotesViewControllerComponent.self)
        binder.install(dependency: NoteDetailsViewControllerComponent.self)
    }

    static func configureRoot(binder bind: ReceiptBinder<Root>) -> BindingReceipt<Root> {
        return bind.to(factory: Root.init)
    }
}



