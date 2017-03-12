//
// Created by iellis on 5/03/2017.
// Copyright (c) 2017 IanEllis. All rights reserved.
//

import Foundation
import RxSwift

protocol NotesRepository {
    func getNotes() -> Observable<Array<NoteEntity>>
}

