//
//  ExpandTableViewCell.swift
//  Sample
//
//  Created by Huy on 12/3/16.
//  Copyright © 2016 Roy Marmelstein. All rights reserved.
//

import UIKit

class ExpandTableViewCell: UITableViewCell, SWComboxViewDelegate {
    
    @IBOutlet weak var viewCombox: UIView!
    
    @IBOutlet weak var viewCon: UIView!
    var k: Bool = false
    var callBack:(()->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCombox2()
        // Initialization code
    }
    
    func setupCombox2(){
        let helper = SWComboxCountryHelper()
        let country = SWCountry()
        country.name = "VietName"
        country.image = UIImage(named: "square-CN.png")
        
        let country1 = SWCountry()
        country1.name = "China"
        country1.image = UIImage(named: "square-CN.png")
        
        let country2 = SWCountry()
        country2.name = "Japen"
        country2.image = UIImage(named: "square-JP.png")
        
        let country3 = SWCountry()
        country3.name = "America"
        country3.image = UIImage(named: "square-US.png")
        
        let list = [country,country1, country2, country3,country,country1, country2, country3,country,country1, country2, country3]
        
        
        
        var comboxView:SWComboxView
        comboxView = SWComboxView.loadInstanceFromNibNamedToContainner(self.viewCon)!
        comboxView.bindData(list, comboxHelper: helper, seletedIndex: 0, comboxDelegate: self, containnerView:self.viewCombox)
    }
    
    func tapComboxToOpenTable(combox: SWComboxView) {
        if combox.isOpen == true {
            k = false
            
            print(k)
        } else {
            k = true
            
            
        }
        if let callBack = self.callBack {
            callBack()
        }
        
    }
    
    func selectedAtIndex(index: Int, combox: SWComboxView) {
        
      
        
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}
