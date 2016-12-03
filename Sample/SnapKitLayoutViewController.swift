//
//  SnapKitLayoutViewController.swift
//  Sample
//
//  Created by Huy on 11/30/16.
//  Copyright © 2016 Roy Marmelstein. All rights reserved.
//

import UIKit

class SnapKitLayoutViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    
    @IBOutlet weak var contenView: UIView!
    
    @IBOutlet weak var avataImgView: UIImageView!
    
    var setUpContraints = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        self.view.addSubview(imgView)
//        imgView.customImageView("imgChim", contentMode: .ScaleAspectFill, borderWidth: 0, masksToBounds: false, cornerRadius: 0)
//        view.addSubview(blackView)
        view.setNeedsUpdateConstraints()
    }
    
    
    override func updateViewConstraints() {
        if (!setUpContraints) {
            imgView.translatesAutoresizingMaskIntoConstraints = true
            imgView.snp_makeConstraints(closure: { (make) in
//                make.top.equalTo(self.view.snp_top).offset(564)
//            //    make.width.equalTo(self.view)
//                make.left.equalTo(self.view.snp_left)
//                make.right.equalTo(self.view.snp_right)
//                make.height.equalTo(300)
                make.center.equalTo(view)
                make.size.equalTo(CGSizeMake(100.0, 100.0))
            })
            setUpContraints = true
        }
        
        super.updateViewConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        if (!setUpContraints) {
////            imgView.translatesAutoresizingMaskIntoConstraints = true
//            imgView.snp_makeConstraints(closure: { (make) in
////                make.top.equalTo(self.view.snp_top).offset(564)
////                //    make.width.equalTo(self.view)
////                make.left.equalTo(self.view.snp_left)
////                make.right.equalTo(self.view.snp_right)
////                make.height.equalTo(300)
//                make.center.equalTo(view)
//                make.size.equalTo(CGSizeMake(100.0, 100.0))
//            })
//            setUpContraints = true
//        }
//        
//        super.updateViewConstraints()
    }
  
}



extension UIImageView {
    
    func customImageView(imageName: String, contentMode: UIViewContentMode,borderWidth:CGFloat ,masksToBounds: Bool ,cornerRadius: CGFloat){
        self.image = UIImage(named: imageName)
        self.contentMode = contentMode
        self.layer.borderWidth = borderWidth
        self.layer.masksToBounds = masksToBounds
        self.layer.cornerRadius = cornerRadius
    }
    
}

