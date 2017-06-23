//
//  StatesViewController.swift
//  MakeSchoolNotes
//
//  Created by Karlygash Zhuginissova on 6/22/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//




// ============== ATTENTION: If you want to run this code, select another Navigation Controller (container of StatesViewController),
// ============== go to Attributes Inspector, check Is Initial View Controller box. Run the project.

// ============== This is the example of Table View Delegate/Data Source and protocols we talked about on Thursday, during the Notes Recap session

import UIKit

//Create a class and conform UITableViewDataSource, UITableViewDelegate protocols
class StatesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let states = ["Alaska",
                 "Alabama",
                 "Arkansas",
                 "American Samoa",
                 "Arizona",
                 "California",
                 "Colorado",
                 "Connecticut",
                 "District of Columbia",
                 "Delaware",
                 "Florida",
                 "Georgia",
                 "Guam",
                 "Hawaii",
                 "Iowa",
                 "Idaho",
                 "Illinois",
                 "Indiana",
                 "Kansas",
                 "Kentucky",
                 "Louisiana",
                 "Massachusetts",
                 "Maryland",
                 "Maine",
                 "Michigan",
                 "Minnesota",
                 "Missouri",
                 "Mississippi",
                 "Montana",
                 "North Carolina",
                 " North Dakota",
                 "Nebraska",
                 "New Hampshire",
                 "New Jersey",
                 "New Mexico",
                 "Nevada",
                 "New York",
                 "Ohio",
                 "Oklahoma",
                 "Oregon",
                 "Pennsylvania",
                 "Puerto Rico",
                 "Rhode Island",
                 "South Carolina",
                 "South Dakota",
                 "Tennessee",
                 "Texas",
                 "Utah",
                 "Virginia",
                 "Virgin Islands",
                 "Vermont",
                 "Washington",
                 "Wisconsin",
                 "West Virginia",
                 "Wyoming"]
    
    var receivedState = ""
    var stateToPass = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign table view delegates to self, which is a current view controller
        tableView.dataSource = self
        tableView.delegate = self

    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateCell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = states[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //when a user taps a cell, we know its index, and can get info inside of the cell, and assign it to stateToPass, and then immediately perform segue
        let cell = tableView.cellForRow(at: indexPath)
        stateToPass = (cell?.textLabel?.text)!
        performSegue(withIdentifier: "toStateDetails", sender: self)
    }
    
    
    @IBAction func unwindToStatesViewController(_ sender: UIStoryboardSegue) {
        //when a user returns to current view controller, create a source view controller, which is DetailViewController, and receive what sourceVC passed you
        if let sourceVC = sender.source as? DetailViewController {
            self.receivedState = sourceVC.stateName
            print("I received renamed state: \(receivedState)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //prepare data to pass to another view controller
        
        if segue.identifier == "toStateDetails" {
            //create a destination view controller
            //assign a variable in destinationVC to state you are passing
            let desinationVC = segue.destination as! DetailViewController
            desinationVC.stateName = stateToPass
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
