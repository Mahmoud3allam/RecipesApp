//
//  IngredientsHeaderView.swift
//  SoftExpertTask
//
//  Created by Alchemist on 2/13/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import Rswift
import UIKit
class IngredientsHeaderView : UIView {
    let headerLabel : UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = R.font.proximaNovaBold(size: 25)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "ingredients"
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.layoutUserInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addSubViews(){
        self.addSubview(self.headerLabel)
    }
    private func layoutUserInterface(){
        self.addSubViews()
        self.setupHeaderLabel()
    }
    
    private func setupHeaderLabel() {
        NSLayoutConstraint.activate([
            self.headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            self.headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            self.headerLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            self.headerLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)
        ])
    }
}
