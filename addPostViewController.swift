//
//  addPostViewController.swift
//  
//
//  Created by Charnpreet Singh on 1/21/17.
//
//

import Foundation
import UIKit
import Firebase

class addPostViewController: UIViewController {
    
    var newPost: Post = Post()
    
    @IBOutlet var foodTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var startDateButton: UIButton!
    @IBOutlet var endDateButton: UIButton!
    
    @IBOutlet var eventTextField: UITextField!
    @IBOutlet var detailTextView: UITextView!
    
    override func viewDidLoad() {
        
        //setup keyboard links
        foodTextField.becomeFirstResponder()
        
        let keyboardDismisser = UITapGestureRecognizer(target: self, action: #selector(addPostViewController.dismissKeyboard))
        self.view.addGestureRecognizer(keyboardDismisser)
        
    }
    
    @IBAction func didEndEditingText(_ sender: UITextField) {
        
        _ = self.navigationController?.popViewController(animated: true)
        
        if let text = sender.text
        {
            switch (sender) {
            case foodTextField:
                newPost.food = text
            case locationTextField:
                newPost.location.alias = text
            case eventTextField:
                newPost.provider = text
            default: break
            }
        }
    }

    func dismissKeyboard()
    {
        self.view.endEditing(true)
    }
    
    //When a date button is pressed
    @IBAction func dateFieldClicked(_ sender: UIButton) {
        //based on what date button we clicked, perform different actions.
        switch (sender) {
        case startDateButton:
            self.performSegue(withIdentifier: "startDate", sender: self)
        case endDateButton:
            self.performSegue(withIdentifier: "endDate", sender: self)
        default: break
        }
    }
    
    //When a segue is triggered
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier
        {
            let datePickerVC = segue.destination as! DatePickerViewController
            
            switch (identifier)
            {
            case "startDate":
                datePickerVC.isStartDatePicker = true
                datePickerVC.questionText = "Pick a start date."
                break
            case "endDate":
                datePickerVC.isStartDatePicker = false
                datePickerVC.questionText = "Pick an end date."
            default:
                break
            }
        }
    }

    @IBAction func addPost(_ sender: Any) {
        newPost.detail = detailTextView.text
        let ref = FIRDatabase.database().reference().child("posts")
        let child = ref.childByAutoId()
        child.setValue(["food" : newPost.food, "detail" : newPost.detail, "provider" : newPost.provider, "start" : dateString(date: newPost.start), "end" : dateString(date: newPost.end), "schema" : newPost.schema, "location" : ["alias" : newPost.location.alias, "latitude" : newPost.location.latitude, "longitude" : newPost.location.longitude]])
        self.navigationController?.popViewController(animated: true)
    }

    
    @IBAction func unwindToAddPostVC(sender: UIStoryboardSegue)
    {
        startDateButton.setTitle(convertDate(date: newPost.start), for: .normal)
        endDateButton.setTitle(convertDate(date: newPost.end), for: .normal)
    }
}
