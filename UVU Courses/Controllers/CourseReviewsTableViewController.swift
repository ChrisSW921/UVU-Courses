//
//  CourseReviewsTableViewController.swift
//  UVU Courses
//
//  Created by Chris Withers on 7/17/20.
//  Copyright © 2020 Chris Withers. All rights reserved.
//

import UIKit

class CourseReviewsTableViewController: UITableViewController {
    
    var currentCourse: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
            performSegue(withIdentifier: "addReview", sender: self)
       }
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destinationVC = segue.destination as! AddReviewViewController
            destinationVC.currentCourse = currentCourse
       }

}
