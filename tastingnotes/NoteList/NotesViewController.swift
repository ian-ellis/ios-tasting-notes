//
//  NotesViewController.swift
//  tastingnotes
//
//  Created by iellis on 5/03/2017.
//  Copyright (c) 2017 IanEllis. All rights reserved.
//

import UIKit


class NotesViewController: UIViewController {

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var table: UITableView!

    private let viewModel: NotesViewModel
    private var presenter: NotesPresenter? = nil

    init(viewModel:NotesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "Notes", bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = NotesPresenter(viewModel, table: table, loading: loadingIndicator)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
