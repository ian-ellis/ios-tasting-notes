//
//  NotesDetailViewControllerComponent.swift
//  tastingnotes
//
//  Created by iellis on 13/5/17.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import Cleanse


struct NoteDetailsVCRoot
{
    let presenter:EditableTitleViewControllerRoot
    init(pres:TaggedProvider<NoteDetailsPresentable>){
        presenter = pres.get()
    }
}

class NoteDetailsViewControllerComponent: ViewControllerComponent  {
    
    typealias Root = NoteDetailsVCRoot
    typealias Seed = TaggedProvider<ViewControllerID>
    
    static func configureRoot(binder bind: ReceiptBinder<Root>) -> BindingReceipt<Root> {
        return bind.to(factory: Root.init)
    }

}
