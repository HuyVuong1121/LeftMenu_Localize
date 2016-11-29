//
//  TableViewController.swift
//  Sample
//
//  Created by Huy on 11/29/16.
//  Copyright © 2016 Roy Marmelstein. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var imageAvata: UIImageView!
    var croppingEnabled: Bool = true
    var libraryEnabled: Bool = true
    var arrData: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        setText()
        imageAvata.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TableViewController.clickCamera)))
        imageAvata.userInteractionEnabled = true
        
        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(TableViewController.loadList(_:)),name:"load", object: nil)
    }
    
    func loadList(notification: NSNotification){
        
        self.tableView.reloadData()
    }
    
    func clickCamera() {
        let camera = CameraViewController(croppingEnabled: croppingEnabled, allowsLibraryAccess: libraryEnabled) { [weak self] image , asset in
            self?.imageAvata.image = image
            self?.dismissViewControllerAnimated(true, completion: nil)
        }
        presentViewController(camera, animated: true, completion: nil)
    }
    func reloaTabView() {
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func acCamera(sender: AnyObject) {
        let camera = CameraViewController(croppingEnabled: croppingEnabled, allowsLibraryAccess: libraryEnabled) { [weak self] image , asset in
            self?.imageAvata.image = image
            self?.dismissViewControllerAnimated(true, completion: nil)
        }
        presentViewController(camera, animated: true, completion: nil)
        
    }
    
    
    func setText() {
        arrData = ["Hello".localized(), "Hi".localized(), "Color".localized()]
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return  1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        cell.lableText?.text = arrData[indexPath.row]
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        var viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MainController")
        
        
        switch indexPath.row {
        case 0:
            let detailViewControllor = storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as? DetailViewController
            
            viewController = detailViewControllor!
        case 1:
            viewController.view.backgroundColor = UIColor.blueColor()
            
        default:
            viewController.view.backgroundColor = UIColor.whiteColor()
            
        }
        let navController = UINavigationController(rootViewController: viewController)
        let elDrawer = (self.navigationController!.parentViewController! as! KYDrawerController)
        elDrawer.mainViewController = navController
        elDrawer.setDrawerState(KYDrawerController.DrawerState.Closed, animated: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(TableViewController.setText), name:LCLLanguageChangeNotification, object: nil)
        
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}
