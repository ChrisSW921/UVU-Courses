//
//  CatalogTableViewController.swift
//  UVU Courses
//
//  Created by Chris Withers on 7/15/20.
//  Copyright © 2020 Chris Withers. All rights reserved.
//

import UIKit
import Firebase

class CatalogTableViewController: UITableViewController {
    
    let db = Firestore.firestore()
    
    let categories = Courses()
    
    var subject_chosen = 0
    
    var classes: [String] = []
    var class_numbers: [String] = []

    let departments:[String] = ["Accounting", "Aerospace Studies", "American Indian Studies", "American Studies", "Anthropology", "Apprentice", "Architecture", "Art", "Art History", "American Sign Language", "Astronomy", "Auto Mechanics", "Autism Studies", "Aviation Science", "Behavioral Science", "Biology", "Building Inspection Technology", "Business/Marketing Education", "Botany", "Biotechnology", "Culinary Arts", "Cabinetry and Archit Woodwork", "Chemistry", "Chinese", "Chinese Studies", "Cinema Studies", "Civil Engineering", "Criminal Justice", "Classical Studies", "Construction Management", "Constitutional Studies", "Communication", "Computing", "Collision Repair Technology", "Computer Science", "Dance", "Dental Hygiene", "Digital Media", "Diesel Mechanics", "Elec Automat and Robotic Tech", "Electrical Comp Engineering", "Edu Child and Family Studies", "Economics", "Edu Early Childhood Education", "Edu Elementary Education", "Edu Secondary Education", "Edu Special Education", "Education", "Engineering Graphics and Design Technology", "English Basic Composition", "English", "Engineering", "Environmental Studies", "Entrepreneurship", "Environmental Management", "Emerg Serv Aircraft Resc FF", "Emergency Services Emergency Care", "Emergency Services", "Emergency Services FireFighting", "Emergency Services Fire Officer", "English as a Second Lang", "Emergency Services Management", "Emergency Services Wildlnd FF", "Exercise Science", "Facilities Management", "Family Studies", "Fine Arts and Theatre", "Finance", "French", "Forensic Science", "Geography", "Geology", "German", "Geographic Information Systems", "Greek", "History", "Community Health", "Hospitality Management", "Honors", "Human Resource Management", "Humanities", "Inderdisciplinary Studies Prog", "Information Management", "Information Systems and Technology", "Intelligence Studies", "Integrated Studies", "Information Technology", "Japanese", "Languages", "Latin", "Legal Studies", "Mathematics", "Mathematics Developmental", "Mechatronics Technology", "Mechanical Engineering", "Meteorology", "Marriage and Family Therapy", "Business Management", "Microbiology", "Military Science", "Marketing", "Masters of Public Service", "Music", "National Security Studies", "Nursing", "Nutrition", "Physical Education Sports", "Physical Education Teacher Ed", "Philosophy", "Physical Science", "Physics", "Peace and Justice Studies", "Political Science", "Portuguese", "Paralegal Studies", "Automotive Power Sports", "Psychology", "Physical Education Recreation", "Respiratory Therapy", "Religious Studies", "Russian", "Student Leadership and Success", "Sociology", "Social Science", "Spanish", "Statistics", "Substance Use Disorder Counseling", "Land Surveying", "Social Work", "Technology Management", "Theatre", "University Studies", "Zoology"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ID = UserDefaults.standard.string(forKey: "ID")
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.1489010155, green: 0.3673349023, blue: 0.2174831033, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return departments.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Category", for: indexPath)
        cell.textLabel?.text = departments[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.textLabel!.numberOfLines = 0
        cell.contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 80).isActive = true
        

        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        subject_chosen = indexPath.row
        self.performSegue(withIdentifier: "GoToCourses", sender: self)
    }
          
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        classes.removeAll()
        let destinationVC = segue.destination as! CoursesTableViewController
        let category = categories.myCourses[subject_chosen]
        for key in category.keys {
            classes.append(key)
        }
        for num in category.values {
            class_numbers.append(num)
        }
        destinationVC.keys = classes
        destinationVC.values = class_numbers
        
    }

}
