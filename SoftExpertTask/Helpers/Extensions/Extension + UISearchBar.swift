//
//  Extension + UISearchBar.swift
//  SoftExpertTask
//
//  Created by Alchemist on 2/12/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit
 extension UISearchBar {
     func setNewcolor(color: UIColor) {
        let clrChange = subviews.flatMap { $0.subviews }
        guard let sc = (clrChange.filter { $0 is UITextField }).first as? UITextField else { return }
        sc.textColor = color
    }
}
