//
//  NotesViewController.swift
//  tastingnotes
//
//  Created by iellis on 5/03/2017.
//  Copyright (c) 2017 IanEllis. All rights reserved.
//

import UIKit
import Cleanse

class NotesViewController: UIViewController {

    private var presenter: ViewControllerRoot?

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        let appRoot:AppRoot? = (UIApplication.shared.delegate as! AppDelegate).appRoot
        let factory:ComponentFactory<NotesViewControllerComponent> = appRoot!.notesViewControllerComponentFactory
        let root = factory.build("NotesViewController")
        
        self.presenter = root.presenter
        self.view = self.presenter!.get()
        
        self.navigationItem.title = root.presenter.title
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
