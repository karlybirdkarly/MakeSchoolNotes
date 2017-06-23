//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteContentTextView: UITextView!
    
    var note: Note?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print all view controllers that are currently in a navigation stack
        let allViewControllers = self.navigationController?.childViewControllers
        print(allViewControllers ?? "navigation stack is empty")

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let listNotesTableViewController = segue.destination as! ListNotesTableViewController

        if let identifier = segue.identifier {
            if identifier == "Save" {
                let note = self.note ?? CoreDataHelper.createNote()
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text ?? ""
                note.modificationTime = Date() as NSDate
                CoreDataHelper.saveNote()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let note = note {
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        } else {
            noteTitleTextField.text = "Note Title"
            noteContentTextView.text = "Enter details here..."
        }
    }


}
