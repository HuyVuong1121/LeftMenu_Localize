//
//  DetailViewController.swift
//  Sample
//
//  Created by Huy on 11/29/16.
//  Copyright © 2016 Roy Marmelstein. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func buttonCamera(sender: AnyObject) {
        let cameraViewController = CameraViewController(croppingEnabled: true, allowsLibraryAccess: true) { [weak self] image , asset in
            self?.imgView.image = image
            self?.dismissViewControllerAnimated(true, completion: nil)
        }
        
        presentViewController(cameraViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func acBack(sender: AnyObject) {
        let vc = storyboard?.instantiateViewControllerWithIdentifier("MainController") as? MenuViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
}
