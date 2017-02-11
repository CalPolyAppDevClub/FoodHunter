//
//  DatePickerViewController.swift
//  FoodHunter
//
//  Created by Charnpreet Singh on 1/28/17.
//  Copyright © 2017 Cal Poly App Dev. All rights reserved.
//

import Foundation
import UIKit

class DatePickerViewController : UIViewController {
    
    var questionText: String?
    var isStartDatePicker: Bool = true
    var date: Date?
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var submitButton: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        //setting up the date picker
        
        titleLabel.text = self.title
        descriptionLabel.text = questionText
        cancelButton.setTitle("Cancel", for: .normal)
        submitButton.setTitle("Submit", for: .normal)
        datePicker.datePickerMode = .dateAndTime
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        date = sender.date
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, let addPostVC = segue.destination as? addPostViewController
        {
            switch (identifier)
            {
                case "unwindSubmit":
                if isStartDatePicker
                {
                    addPostVC.newPost.start = datePicker.date
                }
                else
                {
                    addPostVC.newPost.end = datePicker.date
                }
                
            default:
                break
            }
        }
    }
}
