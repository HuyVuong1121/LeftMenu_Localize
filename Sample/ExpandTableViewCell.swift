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
    
    var list:[SWCountry] = []
    var indexs: Int = 0
    var callBack:(()->Void)?
    var callBackIndex:(()->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCombox2()
    }
    
    func setupCombox2(){
        let helper = SWComboxCountryHelper()
        let country: SWCountry = SWCountry(name: "VietName", image: "square-CN.png")
        let country1  = SWCountry(name: "China", image: "square-CN.png")
        let country2 = SWCountry(name: "Japen", image: "square-JP.png")
        let country3 = SWCountry(name: "America", image: "square-US.png")
        
        list = [country,country1, country2, country3,country,country1, country2, country3,country,country1, country2, country3]
        
        
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
        
        print(list[index].name)
        
        indexs = index
        if let callBackIndex = self.callBackIndex {
            callBackIndex()
        }
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
}
