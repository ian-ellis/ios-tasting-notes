//
// Created by iellis on 5/03/2017.
// Copyright (c) 2017 IanEllis. All rights reserved.
//

import Foundation
import UIKit
import Cleanse

class NotesPresenter : ViewControllerRoot {

    private let view:LoadingTableView
    private let viewModel:NotesViewModel
    private let tableViewDelegate: NotesTableDelegate
    
    
    var title: String { get {
            return "Notes"
        }
    }
    

    init(viewModel:NotesViewModel, view:TaggedProvider<LoadingTable>) {
        
        self.view = view.get()
        self.viewModel = viewModel
        
        self.tableViewDelegate = NotesTableDelegate(self.view.table)
        self.view.table.delegate = tableViewDelegate
        self.view.table.dataSource = tableViewDelegate
        
        self.viewModel.notes.onChange(notesChanged)
        self.viewModel.loading.onChange(loadingChanged)
    
    }
    
    func setOpenDetail(callback:@escaping(NoteEntity)->Void){
        self.tableViewDelegate.noteSelected = callback
    }
    
    public func get() -> UIView {
        return self.view.get()
    }
    
    
    public func tearDown() {
        viewModel.tearDown()
    }


    private func notesChanged(notes: Array<NoteEntity>) -> Void {
        tableViewDelegate.notes = notes
        view.table.reloadData()
    }
    
    private func loadingChanged(isLoading: Bool) -> Void {
        view.loadingIndicator.isHidden = !isLoading
        if (isLoading) {
            view.loadingIndicator.startAnimating()
        } else {
            view.loadingIndicator.stopAnimating()
        }
        view.table.isHidden = isLoading
    }


}
