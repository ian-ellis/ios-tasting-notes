//
// Created by iellis on 6/03/2017.
// Copyright (c) 2017 IanEllis. All rights reserved.
//

import Foundation
import UIKit

@objc class NotesTableDelegate: NSObject, UITableViewDelegate, UITableViewDataSource{

    let NOTE_CELL = "noteCell"

    var notes:Array<NoteEntity> = []
    var noteSelected:((NoteEntity)->Void)?


    init(_ tableView:UITableView){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NOTE_CELL)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: NOTE_CELL) as UITableViewCell!

        // set the text from the data model
        cell.textLabel?.text = self.notes[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = notes[indexPath.row]
        noteSelected?(note)

    }
}
