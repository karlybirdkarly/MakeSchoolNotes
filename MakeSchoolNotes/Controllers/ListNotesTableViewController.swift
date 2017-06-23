//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class ListNotesTableViewController: UITableViewController {
    
    var notes = [Note]() {
        didSet {
            notes.sort(by: { $0.modificationTime?.compare($1.modificationTime! as Date) == .orderedDescending})
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = CoreDataHelper.retrieveNotes()
        notes.sort(by: { $0.modificationTime?.compare($1.modificationTime! as Date) == .orderedDescending})
        tableView.separatorColor = UIColor(red: 255/255, green: 179/255, blue: 0/255, alpha: 1.0)
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
        let row = indexPath.row
        let note = notes[row]
        
        cell.noteTitleLabel.text = note.title
        cell.noteModificationTimeLabel.text = note.modificationTime?.convertToString()
        cell.noteContentLabel.text = note.content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CoreDataHelper.deleteNote(note: notes[indexPath.row])
            notes = CoreDataHelper.retrieveNotes()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "displayNote" {
                print("Table View Cell tapped")
                let indexPath = tableView.indexPathForSelectedRow!
                let note = notes[indexPath.row]
                let displayNoteViewController = segue.destination as! DisplayNoteViewController
                displayNoteViewController.note = note
            }
        }
    }
    
    @IBAction func unwindToListNotesViewController(_ segue: UIStoryboardSegue) {
        self.notes = CoreDataHelper.retrieveNotes()
        
        if let sourceVC = segue.source as? AddNewNoteViewController {
            print(sourceVC.stringToPass)
        }
        
    }
    
}
