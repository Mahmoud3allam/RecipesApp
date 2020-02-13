//
//  BaseNavigationController.swift
//  SoftExpertTask
//
//  Created by Alchemist on 2/11/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import Rswift
class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBarBehaviors()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    private func setupNavigationBarBehaviors() {
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.backgroundColor = #colorLiteral(red: 0.07057783753, green: 0.07059488446, blue: 0.07057412714, alpha: 1)
        self.navigationBar.barTintColor = #colorLiteral(red: 0.07057783753, green: 0.07059488446, blue: 0.07057412714, alpha: 1)
        self.navigationBar.tintColor = .white
        self.navigationBar.isTranslucent = false
        let textAttributeWhenSmallTitle = [NSAttributedString.Key.foregroundColor:UIColor.white , NSAttributedString.Key.font:R.font.proximaNovaABold(size: 20)]
        self.navigationBar.titleTextAttributes = textAttributeWhenSmallTitle as [NSAttributedString.Key : Any]
        let textAttributeWhenLargeTitle = [NSAttributedString.Key.foregroundColor:UIColor.white , NSAttributedString.Key.font:R.font.proximaNovaABold(size: 30)]
        self.navigationBar.largeTitleTextAttributes = textAttributeWhenLargeTitle as [NSAttributedString.Key : Any]
        self.setStatusBarBackGroundColor(withColor: #colorLiteral(red: 0.07057783753, green: 0.07059488446, blue: 0.07057412714, alpha: 1))
    }
}
