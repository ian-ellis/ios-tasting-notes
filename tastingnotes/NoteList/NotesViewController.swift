//
//  NotesViewController.swift
//  tastingnotes
//
//  Created by iellis on 5/03/2017.
//  Copyright (c) 2017 IanEllis. All rights reserved.
//

import UIKit


class NotesViewController: UIViewController {

    private let presenter: NotesPresenter

    init(presenter:NotesPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = presenter.view.get()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
