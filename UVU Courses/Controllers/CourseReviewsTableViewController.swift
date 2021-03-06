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
        loadReviews()
    }
    
    @IBAction func addButton(_ sender: Any) {
        let ID = UserDefaults.standard.string(forKey: "ID")
        var ids: [String] = []
        for item in Reviews {
            ids.append(item.ID)
        }
        
        if !ids.contains(ID!) {
            self.performSegue(withIdentifier: "addReview", sender: self)
        }
            
        
    }
    func loadReviews() {
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
        }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Reviews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Review", for: indexPath)
        cell.textLabel!.numberOfLines = 0
        cell.textLabel!.text = "DATE TAKEN: \(Reviews[indexPath.row].DateTaken) \nPROFESSOR: \(Reviews[indexPath.row].Professor) \nBOOKS: \(Reviews[indexPath.row].Books) \nHOMEWORK: \(Reviews[indexPath.row].Homework) \nEXAMS: \(Reviews[indexPath.row].Exams) \nATTENDANCE: \(Reviews[indexPath.row].Attendance)"
        //cell.contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 200).isActive = true

        return cell
    }

       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destinationVC = segue.destination as! AddReviewViewController
            destinationVC.currentCourse = currentCourse
       }

}
