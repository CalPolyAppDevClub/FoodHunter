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
    }
    
    @IBAction func dateFieldClicked(_ sender: UIButton) {
        self.performSegue(withIdentifier: "datePicker", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if seque == UIStoryboardSegu
    }
}
