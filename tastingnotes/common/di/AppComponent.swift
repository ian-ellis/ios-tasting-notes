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
        binder.include(module: UIWindowModule.self)
    }

    
    static func configureRoot(binder bind: ReceiptBinder<Root>) -> BindingReceipt<Root> {
        return bind.propertyInjector(configuredWith: CoreAppModule.configureAppDelegateInjector)
    }
}


struct CoreAppModule: Cleanse.Module {
    static func configure<B:Binder>(binder: B) {
        
        binder.include(module: ViewControllerModule.self)
        binder.include(module: ViewModelModule.self)
        binder.include(module: RepositoryModule.self)
        binder.include(module: ViewModule.self)
        binder.include(module: PresenterModule.self)
        
        // This satisfies UIWindow depending on TaggedProvider<UIViewController.Root>
        // The actual root is our RootViewController wrapped in a UINavigationController
        binder
            .bind()
            .tagged(with: UIViewController.Root.self)
            .to { UINavigationController(rootViewController: $0 as NotesViewController) }
        
        
    }

    static func configureAppDelegateInjector(binder bind: PropertyInjectionReceiptBinder<AppDelegate>) -> BindingReceipt<PropertyInjector<AppDelegate>> {
        return bind.to(injector: AppDelegate.injectProperties)
    }
}
