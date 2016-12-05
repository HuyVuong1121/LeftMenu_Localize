//
//  SnapKitLayoutViewController.swift
//  Sample
//
//  Created by Huy on 11/30/16.
//  Copyright © 2016 Roy Marmelstein. All rights reserved.
//

import UIKit

@available(iOS 9.0, *)

class SnapKitLayoutViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    
    @IBOutlet weak var contenView: UIView!
    
    @IBOutlet weak var avataImgView: UIImageView!
    
    @IBOutlet weak var stackView01: UIStackView!
    
    @IBOutlet weak var naviCustom: UIView!
    
    var setUpContraints = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "SnapKit..."
     //   naviCustom.removeConstraints(naviCustom.constraints)
        imgView.removeConstraints(imgView.constraints)
        contenView.removeConstraints(contenView.constraints)
        
        avataImgView.removeConstraints(avataImgView.constraints)
        avataImgView.customImageView("swift", contentMode: UIViewContentMode.ScaleAspectFill, borderWidth: 1, masksToBounds: true, cornerRadius: avataImgView.frame.size.width / 2)
        view.setNeedsUpdateConstraints()
    }
    
    
    override func updateViewConstraints() {
        if (!setUpContraints) {
            let superview = self.view
            
//            naviCustom.snp_makeConstraints(closure: { (make) in
//                make.top.equalTo(superview)
//                make.width.equalTo(superview)
//                make.height.equalTo(64)
//            })
            imgView.snp_makeConstraints(closure: { (make) in
                
                make.top.equalTo(superview)
                make.width.equalTo(superview)
                make.height.equalTo(superview).multipliedBy(0.3)
            })
            
            contenView.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(imgView.snp_bottom)
                make.width.equalTo(imgView.snp_width)
                make.bottom.equalTo(superview)
            })
            
            avataImgView.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(imgView.snp_bottom).offset(-50)
                make.centerX.equalTo(imgView.snp_centerX)
                make.size.equalTo(CGSizeMake(100, 100))
            })
            
           stackView01.snp_makeConstraints(closure: { (make) in
            make.centerX.equalTo(contenView.snp_centerX)
            make.centerY.equalTo(contenView.snp_centerY)
            make.left.equalTo(contenView.snp_left).offset(20)
           })
            setUpContraints = true
        }
        
        super.updateViewConstraints()
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

