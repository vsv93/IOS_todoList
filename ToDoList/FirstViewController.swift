//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Venkat on 18/11/16.
//  Copyright © 2016 vsv. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var items = [String]()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }

    override func viewDidAppear(_ animated: Bool) {
        let itemsObj = UserDefaults.standard.object(forKey: "items")
        
        if let tempItems = itemsObj as? [String]{
            items = tempItems
        }
        tableData.reloadData()
        
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            
            items.remove(at: indexPath.row)
            UserDefaults.standard.set(items, forKey: "items")
            tableData.reloadData()
        }
        
        
    }
 
    @IBOutlet weak var tableData: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

