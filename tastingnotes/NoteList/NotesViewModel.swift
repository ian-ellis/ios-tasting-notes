//
// Created by iellis on 5/03/2017.
// Copyright (c) 2017 IanEllis. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Cleanse

class NotesViewModel {

    // dependencies
    let repo: NotesRepository
    // state
    let notes = ObservableField<Array<NoteEntity>>([])
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
            self.notes.value = notes
        }, onError: { e in
            //no-op
        })
    }

    func tearDown(){
        subscription?.dispose()
        notes.clear()
        loading.clear()
    }
    


}
