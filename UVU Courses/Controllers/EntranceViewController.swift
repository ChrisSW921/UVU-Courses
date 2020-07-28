//
//  EntranceViewController.swift
//  UVU Courses
//
//  Created by Chris Withers on 7/28/20.
//  Copyright © 2020 Chris Withers. All rights reserved.
//

import UIKit

class EntranceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1489010155, green: 0.3673349023, blue: 0.2174831033, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
