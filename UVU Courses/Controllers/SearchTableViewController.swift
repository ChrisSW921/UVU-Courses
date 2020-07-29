//
//  SearchTableViewController.swift
//  UVU Courses
//
//  Created by Chris Withers on 7/15/20.
//  Copyright © 2020 Chris Withers. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {

    
    @IBOutlet weak var SearchBar: UISearchBar!
    
    var currentCourse: String = ""
    
    let courses = Courses()
    
    var filteredCourses: [String]!
    var allCourses: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for course in courses.myCourses {
            for key in course.keys{
                allCourses.append("\(key) \(course[key] ?? "")")
            }
        }
        filteredCourses = allCourses
        SearchBar.delegate = self
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredCourses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseSearch", for: indexPath)
        cell.textLabel?.text = filteredCourses[indexPath.row]
        cell.accessoryType = .disclosureIndicator

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentCourse = filteredCourses[indexPath.row]
        performSegue(withIdentifier: "GoToReviews", sender: self)
      }
      
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           let destinationVC = segue.destination as! CourseReviewsTableViewController
           destinationVC.currentCourse = currentCourse
      }

   
}

extension SearchTableViewController: UISearchBarDelegate{

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            filteredCourses = allCourses
        }else{
            filteredCourses = []
            for course in allCourses{
                if course.lowercased().contains(searchText.lowercased()) {
                    filteredCourses.append(course)
                }
            }
            self.tableView.reloadData()
        }
}
}
