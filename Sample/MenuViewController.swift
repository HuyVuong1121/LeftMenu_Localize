//
//  MenuViewController.swift
//  Sample
//
//  Created by Huy on 11/29/16.
//  Copyright © 2016 Roy Marmelstein. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var changeButton: UIButton!
    var app: AppDelegate!

    @IBOutlet weak var resetButton: UIButton!
    
    var actionSheet: UIAlertController!
    
    let availableLanguage = Localize.availableLanguages()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.app = UIApplication.sharedApplication().delegate as? AppDelegate
     //   test()
        setText()
      
               // Do any additional setup after loading the view.
    }
    
        
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MenuViewController.setText), name: LCLLanguageChangeNotification, object: nil)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    func setText() {
        textLabel.text = "Hello world".localized()
        changeButton.setTitle("Change".localized(), forState: .Normal)
        resetButton.setTitle("Reset".localized(), forState: .Normal)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func ChangeButton(sender: AnyObject) {
        
        actionSheet = UIAlertController(title: nil, message: "Change Language".localized(), preferredStyle: .ActionSheet)
        for language in availableLanguage {
            let displayName = Localize.displayNameForLanguage(language)
            let languageAction = UIAlertAction(title: displayName, style: .Default, handler: { (alert) in
                Localize.setCurrentLanguage(language)
                
                
                self.app!.k = true
            })
            actionSheet.addAction(languageAction)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (alert) in
            
        }
        actionSheet.addAction(cancelAction)
        self.presentViewController(actionSheet, animated: true, completion: nil)
        
    }
    func test(){
        if  self.app!.k == true{
            self.app!.k = false
            if let drawerController = navigationController?.parentViewController as? KYDrawerController {
                drawerController.setDrawerState(.Opened, animated: true)
            }
        }
    }
    
    @IBAction func ResetButton(sender: AnyObject) {
        
        Localize.resetCurrentLanguageToDefault()
        
    }
    @IBAction func AcMenu(sender: AnyObject) {
//        if self.app!.k == true {
//            
//             let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//             let redViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("KYDrawerController") as! KYDrawerController
//             self.app!.window?.rootViewController = redViewController
//
//        }else {
            if let drawerController = navigationController?.parentViewController as? KYDrawerController {
                drawerController.setDrawerState(.Opened, animated: true)
            }
    //    }
        
    }

   
}
