//
//  NoteDetailViewController.swift
//  tastingnotes
//
//  Created by iellis on 13/5/17.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import UIKit
import Cleanse

class NoteDetailsViewController : PresentableViewController {

    var detailPresenter: EditableTitleViewControllerRoot?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.edgesForExtendedLayout = []
        
        let appRoot:AppRoot? = (UIApplication.shared.delegate as! AppDelegate).appRoot
        let factory:ComponentFactory<NoteDetailsViewControllerComponent> = appRoot!.noteDetailsViewControllerComponentFactory
        let root:NoteDetailsVCRoot = factory.build("NoteDetailsiewController")
        
        self.detailPresenter =  root.presenter
        self.presenter = self.detailPresenter
        
        self.view = self.presenter!.get()
        
        self.navigationItem.titleView = root.presenter.getTitleView()
    }
    

}
