//
//  PaginationSpinner.swift
//  SoftExpertTask
//
//  Created by Alchemist on 2/12/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit
class PaginationSpinner : UITableViewCell {
    lazy var activityIndicator : UIActivityIndicatorView = {
        var indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        indicator.style = .medium
        indicator.color = .white
        return indicator
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.addSubview(self.activityIndicator)
        self.setupSpinnerConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func showPaginationIndicator(){
        self.activityIndicator.startAnimating()
    }
    func hidePaginationIndicator(){
        self.activityIndicator.stopAnimating()
    }
    private func setupSpinnerConstrains() {
        NSLayoutConstraint.activate([
            self.activityIndicator.heightAnchor.constraint(equalToConstant: 40),
            self.activityIndicator.widthAnchor.constraint(equalToConstant: 40),
            self.activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
}
