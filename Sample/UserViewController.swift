
//
//  UserViewController.swift
//  Sample
//
//  Created by Huy on 11/30/16.
//  Copyright © 2016 Roy Marmelstein. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationCustom()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navigationCustom() {
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: 44))
        self.view.addSubview(navBar);
        let navItem = UINavigationItem(title: "User");
        let  menuItem = UIBarButtonItem(title: "Menu", style: UIBarButtonItemStyle.Plain, target: nil, action: #selector(UserViewController.menu))
        navItem.leftBarButtonItem = menuItem;
        navBar.setItems([navItem], animated: false);
        
    }
    
    func menu(){
        print("click Menu")
        if let drawerController = navigationController?.parentViewController as? KYDrawerController {
            drawerController.setDrawerState(.Opened, animated: true)
        }
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
