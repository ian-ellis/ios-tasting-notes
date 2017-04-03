//
// Created by iellis on 5/03/2017.
// Copyright (c) 2017 IanEllis. All rights reserved.
//

import Foundation
import RxSwift

class StaticNotesRepository: NotesRepository {

    
    init(){
    }

    func getNotes() -> Observable<Array<NoteEntity>> {

        return Observable.just([
            NoteEntity(name: "Test", notes: "Nice!"),
            NoteEntity(name: "Another", notes: "Nicer!")
        ])
    }
}
