//
//  addPostViewController.swift
//  
//
//  Created by Charnpreet Singh on 1/21/17.
//
//

import Foundation
import UIKit

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
            self.performSegue(withIdentifier: "endDat
        default: break
        }
    }
    
    //When a segue is triggered
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier {
            
            let destination = segue.destination as! DatePickerViewController
            
            switch(identifier) {
            case "startDate":
                destination.date = newPost.start
            case "endDate":
                destination.date = newPost.end
            default: break
            }
        }
    }
    
    @IBAction func unwindToAddPostVC(sender: UIStoryboardSegue)
    {
        startDateButton.setTitle(newPost.start.debugDescription, for: .normal)
        endDateButton.setTitle(newPost.end.debugDescription, for: .normal)
    }
}
