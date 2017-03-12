//
// Created by iellis on 9/03/2017.
// Copyright (c) 2017 IanEllis. All rights reserved.
//

import Foundation
import Cleanse
import UIKit

struct AppComponent: Cleanse.RootComponent {
    typealias Root = PropertyInjector<AppDelegate>
    typealias Scope = Singleton

    static func configure<B:Binder>(binder: B) {
        binder.include(module: CoreAppModule.self)
        binder.include(module: UIWindow.Module.self)
    }

    
    static func configureRoot(binder bind: ReceiptBinder<Root>) -> BindingReceipt<Root> {
        return bind.propertyInjector(configuredWith: CoreAppModule.configureAppDelegateInjector)
    }
}


struct CoreAppModule: Cleanse.Module {
    static func configure<B:Binder>(binder: B) {
        binder.include(module: NotesViewController.Module.self)
        
        
    }

    static func configureAppDelegateInjector(binder bind: PropertyInjectionReceiptBinder<AppDelegate>) -> BindingReceipt<PropertyInjector<AppDelegate>> {
        return bind.to(injector: AppDelegate.injectProperties)
    }
}
