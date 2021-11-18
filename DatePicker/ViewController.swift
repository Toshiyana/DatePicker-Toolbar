//
//  ViewController.swift
//  DatePicker
//
//  Created by Toshiyana on 2021/11/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createDatePicker()
    }

    func createDatePicker() {
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // bar button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonPressed))
        toolbar.setItems([doneButton], animated: true)
        
        // assign toolbar
        dateTextField.inputAccessoryView = toolbar
        
        // assign datePicker to the textField
        dateTextField.inputView = datePicker
        
        // dateTextField style
        dateTextField.textAlignment = .center
        
        // datePicker style
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
    }

    @objc func doneButtonPressed() {
        // formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        dateTextField.text = formatter.string(from: datePicker.date)
        view.endEditing(true)
    }
}

