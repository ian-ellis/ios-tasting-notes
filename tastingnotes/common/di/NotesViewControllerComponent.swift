//
//  NotesViewControllerComponent.swift
//  tastingnotes
//
//  Created by iellis on 3/04/2017.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import Cleanse

struct NotesVCRoot
{
    let presenter:ViewControllerRoot
    init(pres:TaggedProvider<NotesPresentable>){
        presenter = pres.get()
    }
    
}

struct NotesViewControllerComponent : ViewControllerComponent {
    typealias Root = NotesVCRoot
    typealias Seed = TaggedProvider<ViewControllerID>
    
    static func configureRoot(binder bind: ReceiptBinder<Root>) -> BindingReceipt<Root> {
        return bind.to(factory: Root.init)
    }

}
