//
//  CatalogTableViewController.swift
//  UVU Courses
//
//  Created by Chris Withers on 7/15/20.
//  Copyright © 2020 Chris Withers. All rights reserved.
//

import UIKit

class CatalogTableViewController: UITableViewController {

    let departments:[String] = ["Accounting", "Aerospace Studies", "American Indian Studies", "American Studies", "Anthropology", "Apprentice", "Architecture", "Art", "Art History", "American Sign Language", "Astronomy", "Auto Mechanics", "Autism Studies", "Aviation Science", "Behavioral Science", "Biology", "Building Inspection Technology", "Business/Marketing Education", "Botany", "Biotechnology", "Culinary Arts", "Cabinetry and Archit Woodwork", "Chemistry", "Chinese", "Chinese Studies", "Cinema Studies", "Civil Engineering", "Criminal Justice", "Classical Studies", "Construction Management", "Constitutional Studies", "Communication", "Computing", "Collision Repair Technology", "Computer Science", "Dance", "Dental Hygiene", "Digital Media", "Diesel Mechanics", "Elec Automat and Robotic Tech", "Electrical Comp Engineering", "Edu Child and Family Studies", "Economics", "Edu Early Childhood Education", "Edu Elementary Education", "Edu Secondary Education", "Edu Special Education", "Education", "Engineering Graphics and Design Technology", "English Basic Composition", "English", "Engineering", "Environmental Studies", "Entrepreneurship", "Environmental Management", "Emerg Serv Aircraft Resc FF", "Emergency Services Emergency Care", "Emergency Services", "Emergency Services FireFighting", "Emergency Services Fire Officer", "English as a Second Lang", "Emergency Services Management", "Emergency Services Wildlnd FF", "Exercise Science", "Facilities Management", "Family Studies", "Fine Arts and Theatre", "Finance", "French", "Forensic Science", "Geography", "Geology", "German", "Geographic Information Systems", "Greek", "History", "Community Health", "Hospitality Management", "Honors", "Human Resource Management", "Humanities", "Inderdisciplinary Studies Prog", "Information Management", "INformation Systems and Technology", "Intelligence Studies", "Integrated Studies", "Information Technology", "Japanese", "Languages", "Latin", "Legal Studies", "Mathematics", "Mathematics Developmental", "Mechatronics Technology", "Mechanical Engineering", "Meteorology", "Marriage and Family Therapy", "Business Management", "Microbiology", "Military Science", "Marketing", "Masters of Public Service", "Music", "National Security Studies", "Nursing", "Nutrition", "Physical Education Sports", "Physical Education Teacher Ed", "Philosophy", "Physical Science", "Physics", "Peace and Justice Studies", "Political Science", "Portuguese", "Paralegal Studies", "Automotive Power Sports", "Psychology", "Physical Education Recreation", "Respiratory Therapy", "Religious Studies", "Russian", "Student Leadership and Success", "Sociology", "Social Science", "Spanish", "Statistics", "Substance Use Disorder Counseling", "Land Surveying", "Social Work", "Technology Management", "Theatre", "University Studies", "Zoology"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return departments.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Category", for: indexPath)
        cell.textLabel?.text = departments[indexPath.row]
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
