//
//  DetailViewController.swift
//  MakeSchoolNotes
//
//  Created by Karlygash Zhuginissova on 6/22/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var stateName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.text = stateName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onSendBack(_ sender: Any) {
        stateName = textField.text!
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
