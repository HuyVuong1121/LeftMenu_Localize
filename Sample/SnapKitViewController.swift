//
//  SnapKitViewController.swift
//  Sample
//
//  Created by Huy on 11/30/16.
//  Copyright © 2016 Roy Marmelstein. All rights reserved.
//

import UIKit

class SnapKitViewController: UIViewController {
 
///--------------------------------------------------------
    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.redColor()
        
        return view
    }()
    let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blueColor()
        
        return view
    }()
    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.greenColor()
        
        return view
    }()
    let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.whiteColor()
        
        return view
    }()
    
// MARK: --------2222222222------------
    
    let redView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.redColor()
        
        return view
    }()
    let blueView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blueColor()
        
        return view
    }()
    let greenView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.greenColor()
        
        return view
    }()
    let whiteView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.whiteColor()
        
        return view
    }()
 ///---------------------------------------------
    let imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imgChim")
        imageView.contentMode = .ScaleAspectFill
        return imageView
    }()
    let imgView2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "swift")
        imageView.contentMode = .ScaleAspectFill
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 25
        return imageView
    }()
    var setUpConstraints = false
    let scrollView = UIScrollView()
    let contenView = UIView()
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.whiteColor()
        label.numberOfLines = 0
        label.lineBreakMode = .ByClipping
        label.textColor = UIColor.blackColor()
        label.text = NSLocalizedString("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", comment: "")
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
   /*     view.addSubview(redView)
        view.addSubview(blueView)
        view.addSubview(greenView)
        view.addSubview(whiteView)
        
         
        view.addSubview(redView2)
        view.addSubview(blueView2)
 
 */
        
///-----------2222222222222------------------------------
     
 /*
        view.addSubview(redView)
        redView.addSubview(blueView)
        view.addSubview(greenView)
        view.addSubview(whiteView)
        view.addSubview(greenView2)
        view.addSubview(whiteView2)
        view.addSubview(redView2)
        view.addSubview(blueView2)
*/
        
 ///-------3-33-3--33-3--------
        
        view.addSubview(imgView)
        view.addSubview(greenView)
        view.addSubview(imgView2)
        
        greenView.addSubview(scrollView)
        scrollView.addSubview(contenView)
        contenView.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    override func updateViewConstraints() {
        
        if (!setUpConstraints){
        
            
     // MARK: layout --------33333333333--------------------------------
        
           imgView.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(self.view)
                make.width.equalTo(self.view)
                make.height.equalTo(self.view).multipliedBy(0.4)
            
           })
            
            imgView2.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(imgView.snp_bottom).offset(-50)
                make.centerX.equalTo(imgView.snp_centerX)
                make.size.equalTo(CGSizeMake(100, 100))
            })
            
            greenView.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(imgView.snp_bottom)
                make.width.equalTo(self.view)
                make.bottom.equalTo(self.view)
            })
            
           
            scrollView.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(greenView).offset(60)
                make.width.equalTo(greenView.snp_width)
                make.bottom.equalTo(greenView.snp_bottom)
            })
            
            contenView.snp_makeConstraints(closure: { (make) in
                make.edges.equalTo(scrollView).inset(UIEdgeInsetsZero)
                make.width.equalTo(scrollView)
            })
            
            label.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(contenView).offset(20)
                make.bottom.equalTo(contenView).offset(-20)
                make.left.equalTo(contenView).offset(20)
                make.right.equalTo(contenView).offset(-20)
            })
            
    // MARK: layout -------------11111111111--------------------------------
    /*
    
            redView.snp_makeConstraints(closure: { (make) in
                make.centerX.equalTo(self.view)
                make.top.equalTo(self.view).offset(20)
                make.size.equalTo(CGSizeMake(100, 100))
            })
            
            blueView.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(redView.snp_bottom).offset(10)
                make.centerX.equalTo(redView.snp_centerX)
                make.size.equalTo(CGSizeMake(100, 100))
            })
            
            greenView.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(blueView.snp_bottom).offset(10)
                make.leading.equalTo(blueView.snp_leading)
                make.trailing.equalTo(blueView.snp_trailing)
                make.height.equalTo(50)
            })
            
            whiteView.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(greenView.snp_bottom).offset(10)
                make.centerX.equalTo(greenView.snp_centerX)
                make.size.equalTo(redView.snp_size)
            })
            
            redView2.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(whiteView.snp_bottom).offset(50)
                make.left.equalTo(self.view).offset(20)
                make.size.equalTo(whiteView.snp_size)
            })
            
            blueView2.snp_makeConstraints(closure: { (make) in
                make.left.equalTo(redView2.snp_right).offset(10)
                make.centerY.equalTo(redView2.snp_centerY)
                make.size.equalTo(redView2.snp_size)
            })
*/
 // MARK: layout --------2222222222------------
            
/*           redView.snp_makeConstraints(closure: { (make) in
                make.centerX.equalTo(self.view)
                make.centerY.equalTo(self.view)
                make.size.equalTo(CGSizeMake(200, 200))
            })
            
            blueView.snp_makeConstraints(closure: { (make) in
                make.centerX.equalTo(redView)
                make.centerY.equalTo(redView)
                make.size.equalTo(redView.snp_size).multipliedBy(0.5)
            })
            
            greenView.snp_makeConstraints(closure: { (make) in
                make.bottom.equalTo(redView.snp_top)
                make.leading.equalTo(redView.snp_trailing)
                make.size.equalTo(blueView.snp_size)
            })
            
            whiteView.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(redView.snp_bottom)
                make.trailing.equalTo(redView.snp_leading)
                make.size.equalTo(greenView.snp_size)
            })
            
            greenView2.snp_makeConstraints(closure: { (make) in
                make.bottom.equalTo(redView.snp_top)
                make.trailing.equalTo(redView.snp_leading)
                make.size.equalTo(CGSizeMake(50, 50))
            })
            
            whiteView2.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(redView.snp_bottom)
                make.leading.equalTo(redView.snp_trailing)
                make.size.equalTo(CGSizeMake(50, 50))
            })
            
            
            redView2.snp_makeConstraints(closure: { (make) in
                make.bottom.equalTo(redView.snp_top).offset(-100)
                make.centerX.equalTo(redView.snp_centerX)
                make.size.equalTo(CGSizeMake(100, 100))
            })
            
            blueView2.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(redView.snp_bottom).offset(100)
                make.centerX.equalTo(redView.snp_centerX)
                make.size.equalTo(CGSizeMake(100, 100))
            })
*/
            
            
            
            setUpConstraints = true
        }
        
        
        super.updateViewConstraints()
        
        
        
    }
 

}
