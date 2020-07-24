//
//  CourseReviewsTableViewController.swift
//  UVU Courses
//
//  Created by Chris Withers on 7/17/20.
//  Copyright © 2020 Chris Withers. All rights reserved.
//

import UIKit
import Firebase

class CourseReviewsTableViewController: UITableViewController {
    
    var currentCourse: String = ""

    var Reviews: [Review] = []
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestions()
    }
    
    func loadQuestions() {
        db.collection("Reviews")
                .addSnapshotListener { (querySnapshot, error) in
                self.Reviews = []
                if let e = error {
                    print("There was an issue retrieving data from firestore. \(e)")
                }else {
                    if let snapshotDocuments = querySnapshot?.documents {
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            if let Name = data["Course"] as? String, let Date = data["Date"] as? String, let Prof = data["Professor"] as? String, let Books = data["Books"] as? String, let Homework = data["Homework"] as? String, let Exams = data["Exams"] as? String, let attendance = data["Attendance"] as? String, let id = data["ID"] as? String {
                                print("Here now")
                                var newReview = Review()
                                newReview.CourseName = Name
                                newReview.DateTaken = Date
                                newReview.Professor = Prof
                                newReview.Books = Books
                                newReview.Homework = Homework
                                newReview.Exams = Exams
                                newReview.Attendance = attendance
                                newReview.ID = id
                                if Name == self.currentCourse {
                                    self.Reviews.append(newReview)
                                    print("Added")
                                }
                                else{
                                    print("1 \(Name)")
                                    print("2 \(self.currentCourse)")
                                }
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                                
                            }
                        
                        }
                    }
                }
            }
        print("Im here")
        }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Reviews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Review", for: indexPath)
        cell.textLabel!.numberOfLines = 0
        cell.textLabel!.text = Reviews[indexPath.row].Exams
        cell.contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 80).isActive = true

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
            performSegue(withIdentifier: "addReview", sender: self)
       }
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destinationVC = segue.destination as! AddReviewViewController
            destinationVC.currentCourse = currentCourse
       }

}
