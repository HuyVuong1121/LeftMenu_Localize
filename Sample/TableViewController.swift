//
//  TableViewController.swift
//  Sample
//
//  Created by Huy on 11/29/16.
//  Copyright © 2016 Roy Marmelstein. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SWComboxViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var imageAvata: UIImageView!
    
    var croppingEnabled: Bool = true
    
    var libraryEnabled: Bool = true
    
    var arrData: [String] = []
    
    var k : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        setText()
        imageAvata.layer.borderWidth = 1.0
        imageAvata.layer.masksToBounds = false
        imageAvata.layer.borderColor = UIColor.whiteColor().CGColor
        imageAvata.layer.cornerRadius = imageAvata.frame.size.width/2
        imageAvata.clipsToBounds = true
        imageAvata.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TableViewController.clickCamera)))
        imageAvata.userInteractionEnabled = true
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        let nibExpand = UINib(nibName: "ExpandTableViewCell", bundle: nil)
        tableView.registerNib(nibExpand, forCellReuseIdentifier: "CellExpand")
        
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
        arrData = ["Click".localized(), "Hi".localized(), "Color".localized(), "Hello".localized()]
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return  1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell?
        
        switch indexPath.row {
        case 3:
            let dequecell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
            dequecell.labelText?.text = arrData[indexPath.row]
            
            cell = dequecell
            
        case 1:
            let dequecell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
            dequecell.labelText?.text = arrData[indexPath.row]
            
            cell = dequecell
            
        case 2:
            let dequecell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
            dequecell.labelText?.text = arrData[indexPath.row]
            
            cell = dequecell
            
        case 0:
            let dequecell = tableView.dequeueReusableCellWithIdentifier("CellExpand", forIndexPath: indexPath) as! ExpandTableViewCell
            
            dequecell.callBack  = {
                if dequecell.k == false{
                    self.k = false
                    tableView.reloadData()
                } else {
                    self.k = true
                    tableView.reloadData()
                }

            }
            dequecell.callBackIndex = {
                print(dequecell.list[dequecell.indexs].name)
            }
            cell = dequecell
            
        default:
            let cells = UITableViewCell()
            cell = cells
        }
        
        return cell!
        
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if k == true {
            if indexPath.row == 0 {
                return 200
            } else {
                return 80
            }
        }
        else {
            return 80
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        var viewController = UIViewController()
        
        switch indexPath.row {
        case 0:
            let table = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("TableViewController")
            viewController = table
        case 1:
            let detailViewControllor = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("DetailViewController")
            viewController = detailViewControllor
        case 2:
            let tabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("RAMAnimatedTabBarController")
            viewController = tabBarController
        case 3:
            let viewControllers = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MainController")
            viewController = viewControllers
            
        default:
            let viewControllers = UIViewController()
            viewController = viewControllers
            
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
