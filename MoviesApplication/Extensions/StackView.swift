//
//  StackView.swift
//  MoviesApplication
//
//  Created by Burak Yılmaz on 30.05.2020.
//  Copyright © 2020 Burak Yılmaz. All rights reserved.
//

import Foundation
import UIKit

//TODO: Removing StackView elements
extension UIStackView {
    func removeAllSubviews() {
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
    }
}
