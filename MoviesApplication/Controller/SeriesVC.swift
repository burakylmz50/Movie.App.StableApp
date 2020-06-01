//
//  SeriesVC.swift
//  MoviesApplication
//
//  Created by Burak Yılmaz on 1.06.2020.
//  Copyright © 2020 Burak Yılmaz. All rights reserved.
//

import UIKit
import SnapKit

class SeriesVC: UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(red: 0.149, green: 0.157, blue: 0.184, alpha: 1)
        super.viewDidLoad()
        setLabel()
        paddingLabel()
    }
    
    let label = UILabel()
    func setLabel(){
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(view.snp.top).offset(100)
        }
    }
    
    func paddingLabel(){
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Çok Yakında :)"
    }
    
}
