//
//  NoteDetailsPresenter.swift
//  tastingnotes
//
//  Created by iellis on 13/5/17.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Cleanse

class NoteDetailsPresenter : EditableTitleViewControllerRoot {
   
    private let view:NoteDetailsView
    private let viewModel:NoteDetailsViewModel
    private let titleView:EditableNavigationTitleView
    private var titleUpdatedCallback:DisposableEvent?
    
    var title: String { get {
        return "Note Details"
        }
    }
    
    init(viewModel:NoteDetailsViewModel, view:TaggedProvider<NoteDetailsTag>, titleView:EditableNavigationTitleView) {
        
        self.view = view.get()
        self.viewModel = viewModel
        self.titleView = titleView
        self.titleUpdatedCallback = titleView.updated.addHandler(target: self, handler: NoteDetailsPresenter.titleViewUpdated)
        viewModel.title.onChange(titleChanged)
    }
    
    //expose views
    
    public func get() -> UIView {
        return self.view
    }
    
    public func getTitleView() -> UIView {
        return self.titleView
    }
    
    // view model bindings
    
    private func titleChanged(title: String) -> Void {
        titleView.title = title
    }
    
    private func titleViewUpdated (title: String) -> Void  {
        viewModel.title.value = title
    }
    
    // view controller callbacks
    
    public func viewDidLayoutSubviews() {
        // TODO: make the scroll view work
    }
    
    // teardown
    
    public func tearDown() {
        viewModel.tearDown()
        titleUpdatedCallback?.dispose()
    }
}
