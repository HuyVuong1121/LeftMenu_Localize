//
//  ExpandvViewController.swift
//  Sample
//
//  Created by Huy on 12/3/16.
//  Copyright © 2016 Roy Marmelstein. All rights reserved.
//

import UIKit

class ExpandvViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var expandTableView: UITableView!
    
    let arrayForTableView = ["Swift", "Php", "Java"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expandTableView.dataSource = self
        expandTableView.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension ExpandvViewController {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayForTableView.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        cell?.textLabel?.text = arrayForTableView[indexPath.row]
        
        return cell!
    }
    
}