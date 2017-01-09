//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Venkat on 18/11/16.
//  Copyright © 2016 vsv. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    var items : [String] = []

    @IBOutlet weak var itemField: UITextField!
    @IBAction func addItem(_ sender: Any) {
        
        let itemsObj = UserDefaults.standard.object(forKey: "items")
        
        if let tempItems = itemsObj as? [String]{
            items = tempItems
            items.append(itemField.text!)
        } else {
            
            items = [itemField.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        itemField.text = ""
            
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

