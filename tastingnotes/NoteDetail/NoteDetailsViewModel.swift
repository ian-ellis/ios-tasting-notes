//
//  NoteDetailsViewModel.swift
//  tastingnotes
//
//  Created by iellis on 13/5/17.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Cleanse

class NoteDetailsViewModel {
    // dependencies
    let repo: NotesRepository
    // state
    let note = ObservableField<NoteEntity?>(nil)
    
    let title = ObservableField<String>("")
    let loading = ObservableField<Bool>(true)
    var subscription:Disposable? = nil
    
    init(repository:TaggedProvider<StaticNotes>) {
        self.repo = repository.get()
        load()
    }
    
    private func load(){
        subscription?.dispose()
        subscription = repo.getNotes().flatMap{notes in
            Observable<Int>.timer(2.0, scheduler: MainScheduler.instance)
                .map { _ in return notes }
            }.subscribe(onNext: { notes in
                self.loading.value = false
                self.note.value = notes[0]
                self.title.value = notes[0].name
            }, onError: { e in
                //no-op
            })
    }
    
    func tearDown(){
        subscription?.dispose()
        
        note.clear()
        loading.clear()
    }
}
