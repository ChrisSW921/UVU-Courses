//
//  CoursesTableViewController.swift
//  UVU Courses
//
//  Created by Chris Withers on 7/16/20.
//  Copyright © 2020 Chris Withers. All rights reserved.
//

import UIKit

class CoursesTableViewController: UITableViewController {

    
    var keys: [String] = []
    var values: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Here")
        print(keys)
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return keys.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Course", for: indexPath)
        cell.textLabel!.numberOfLines = 0
        cell.contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 80).isActive = true
        cell.textLabel!.text = "\(keys[indexPath.row])  \(values[indexPath.row])"
        return cell
    }

    
}
