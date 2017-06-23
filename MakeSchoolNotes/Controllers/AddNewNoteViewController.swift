//
//  AddNewNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Karlygash Zhuginissova on 6/22/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import UIKit

class AddNewNoteViewController: UIViewController {

    @IBOutlet weak var noteTitleTextField: UITextField!
    
    @IBOutlet weak var noteContentTextView: UITextView!
    
    var stringToPass = "Hey, I am a passed string"
    
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
                let note = CoreDataHelper.createNote()
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text ?? ""
                note.modificationTime = Date() as NSDate
                CoreDataHelper.saveNote()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noteTitleTextField.text = "Note Title"
        noteContentTextView.text = "Enter details here..."
        
    }
    

}
