//
//  AddReviewViewController.swift
//  UVU Courses
//
//  Created by Chris Withers on 7/17/20.
//  Copyright © 2020 Chris Withers. All rights reserved.
//

import UIKit
import Firebase


class AddReviewViewController: UIViewController {
    
    let db = Firestore.firestore()

    @IBOutlet weak var courseTitle: UILabel!
    
    @IBOutlet weak var datePicker: UIPickerView!
    
    @IBOutlet weak var Professor: UITextView!
    
    @IBOutlet weak var Books: UITextView!
    
    @IBOutlet weak var Homework: UITextView!
    
    @IBOutlet weak var Exams: UITextView!
    
    @IBOutlet weak var Attendance: UISegmentedControl!
    
    
    @IBAction func Save(_ sender: UIButton) {
        
        let title = Attendance.titleForSegment(at: Attendance.selectedSegmentIndex)
        
        let ID = UserDefaults.standard.string(forKey: "ID")
        
        let not_allowed = "Write here..."
        
        if Professor.text == not_allowed || Books.text == not_allowed || Homework.text == not_allowed || Exams.text == not_allowed {
            let alert  = UIAlertController(title: "Please fill out all fields", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(alert: UIAlertAction) in
            }))
            self.present(alert, animated: true, completion: nil)
        }else {
            db.collection("Reviews").addDocument(data: [
                "Course": courseTitle.text!,
                "Date": dateTaken,
                "Professor": Professor.text!,
                "Books": Books.text!,
                "Homework": Homework.text!,
                "Exams": Exams.text!,
                "Attendance": title!,
                "ID": ID!
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    let alert  = UIAlertController(title: "Review Saved!", message: "", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(alert: UIAlertAction) in 
                        self.navigationController?.popViewController(animated: true)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }

    }
    
    var dateTaken: String = ""
    
    var currentCourse: String = ""
    
    let years = ["Spring 2000", "Summer 2000", "Fall 2000", "Spring 2001", "Summer 2001", "Fall 2001", "Spring 2002", "Summer 2002", "Fall 2002", "Spring 2003", "Summer 2003", "Fall 2003", "Spring 2004", "Summer 2004", "Fall 2004", "Spring 2005", "Summer 2005", "Fall 2005", "Spring 2006", "Summer 2006", "Fall 2006", "Spring 2007", "Summer 2007", "Fall 2007", "Spring 2008", "Summer 2008", "Fall 2008", "Spring 2009", "Summer 2009", "Fall 2009", "Spring 2010", "Summer 2010", "Fall 2010", "Spring 2011", "Summer 2011", "Fall 2011", "Spring 2012", "Summer 2012", "Fall 2012", "Spring 2013", "Summer 2013", "Fall 2013", "Spring 2014", "Summer 2014", "Fall 2014", "Spring 2015", "Summer 2015", "Fall 2015", "Spring 2016", "Summer 2016", "Fall 2016", "Spring 2017", "Summer 2017", "Fall 2017", "Spring 2018", "Summer 2018", "Fall 2018", "Spring 2019", "Summer 2019", "Fall 2019", "Spring 2020", "Summer 2020", "Fall 2020"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.delegate = self
        datePicker.dataSource = self
        courseTitle.text = currentCourse
        datePicker.setValue(UIColor.white, forKey: "textColor")
    }
    

}




//MARK: UI PICKER VIEW EXTENSION


extension AddReviewViewController: UIPickerViewDelegate {
    
}

extension AddReviewViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return years.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return years[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dateTaken = years[row]
    }
    
    
    
}
