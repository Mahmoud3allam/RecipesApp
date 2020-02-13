//
//  Extension + UIViewController.swift
//  SoftExpertTask
//
//  Created by Alchemist on 2/11/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    func setStatusBarBackGroundColor(withColor color:UIColor) {
        DispatchQueue.main.async {
            let tag = 12321
            if let taggedView = self.view.viewWithTag(tag){
                taggedView.removeFromSuperview()
            }
            let overView = UIView()
            overView.frame = UIApplication.shared.statusBarFrame
            overView.backgroundColor = color
            overView.tag = tag
            self.view.addSubview(overView)
        }
    }
}
