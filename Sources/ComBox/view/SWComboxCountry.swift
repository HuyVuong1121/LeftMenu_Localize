//
//  SWComboxCountryView.swift
//  AuntFood
//
//  Created by shouwei on 3/8/15.
//  Copyright (c) 2015 shou. All rights reserved.
//

import UIKit

class SWCountry:NSObject {
    var name:String!
    var image:UIImage!
    
    init(name: String, image: String) {
        self.name = name
        self.image = UIImage(named: image)
    }
}


class SWComboxCountry: UIView {
    
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    func bindCountry(country: SWCountry)
    {
        bindImage(country.image, title: country.name)
    }
    
    func bindImage(image:UIImage, title: String)
    {
        icon.image = image
        name.text = title
    }
}
