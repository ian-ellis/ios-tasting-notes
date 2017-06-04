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
    
    public func get() -> UIView {
        return self.view
    }
    
    public func getTitleView() -> UIView {
        return self.titleView
    }
    
    public func tearDown() {
        viewModel.tearDown()
    }
    
    private func titleChanged(title: String) -> Void {
        titleView.title = title
    }
    
    private func titleViewUpdated (title: String) -> Void  {
        viewModel.title.value = title
    }
    
    public func viewDidLayoutSubviews() {
        let contentSize = view.content.frame.size
        let scrollSize = view.scrollView.frame.size
//        view.scrollView.isScrollEnabled = true
//        view.scrollView.contentSize = contentSize
    }
}
