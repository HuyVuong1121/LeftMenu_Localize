//
//  SnapKitUpdateContraintsVC.swift
//  Sample
//
//  Created by Huy on 12/5/16.
//  Copyright © 2016 Roy Marmelstein. All rights reserved.
//

import UIKit


class SnapKitUpdateContraintsVC: UIViewController {

    @IBOutlet weak var contenView01: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    var setUpcontraints = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contenView01.removeConstraints(contenView01.constraints)
        imgView.removeConstraints(imgView.constraints)
        button.removeConstraints(button.constraints)
        view.needsUpdateConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func updateViewConstraints() {
        if !(setUpcontraints) {
                contenView01.snp_updateConstraints(closure: { (make) in
                    let superview = self.view
                    make.centerX.equalTo(superview)
                    make.centerY.equalTo(superview)
                    make.size.equalTo(CGSizeMake(240, 200))
                })
            
            imgView.snp_updateConstraints(closure: { (make) in
                make.bottom.equalTo(contenView01.snp_top).offset(-20)
                make.centerX.equalTo(contenView01.snp_centerX)
                make.size.equalTo(CGSizeMake(100, 100))
            })
            button.snp_updateConstraints(closure: { (make) in
                make.top.equalTo(contenView01.snp_bottom).offset(20)
                make.centerX.equalTo(contenView01.snp_centerX)
                make.size.equalTo(CGSizeMake(200, 100))
            })
            setUpcontraints = true
        }
        
        
        super.updateViewConstraints()
        
    }
    

}
