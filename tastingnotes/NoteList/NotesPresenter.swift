//
// Created by iellis on 5/03/2017.
// Copyright (c) 2017 IanEllis. All rights reserved.
//

import Foundation
import UIKit

class NotesPresenter {

    private let table: UITableView
    private let loading: UIActivityIndicatorView
    private let tableViewDelegate: NotesTableDelegate

    init(_ viewModel: NotesViewModel, table: UITableView, loading: UIActivityIndicatorView) {
        self.table = table
        self.loading = loading
        self.tableViewDelegate = NotesTableDelegate(table)
        self.table.delegate = tableViewDelegate
        self.table.dataSource = tableViewDelegate

        viewModel.notes.onChange(notesChanged)
        viewModel.loading.onChange(loadingChanged)
    }


    private func notesChanged(notes: Array<NoteEntity>) -> Void {
        tableViewDelegate.notes = notes
        table.reloadData()
    }

    private func loadingChanged(isLoading: Bool) -> Void {
        loading.isHidden = !isLoading
        if (isLoading) {
            loading.startAnimating()
        } else {
            loading.stopAnimating()
        }
        table.isHidden = isLoading
    }


}
