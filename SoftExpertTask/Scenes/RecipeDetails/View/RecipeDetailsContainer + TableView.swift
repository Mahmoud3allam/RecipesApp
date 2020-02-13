//
//  RecipeDetailsContainer + TableView.swift
//  SoftExpertTask
//
//  Created by Alchemist on 2/13/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit
extension RecipeDetailsContailer : UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ingredients.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ingredientsCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
        ingredientsCell.backgroundColor = .clear
        ingredientsCell.textLabel?.numberOfLines = 0
        ingredientsCell.textLabel?.textColor = .white
        ingredientsCell.selectionStyle = .none
        ingredientsCell.textLabel?.text = self.ingredients[indexPath.item] != "" ? self.ingredients[indexPath.item] : "There's No Ingredients For This Recipes".capitalized
        ingredientsCell.textLabel?.font = R.font.proximaNovaARegular(size: 20)
        return ingredientsCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let ingredientsHeaderView = IngredientsHeaderView()
        return ingredientsHeaderView
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.item == self.ingredients.count - 1 {
            self.calculateScrollHeight()
        }
        cell.transform = CGAffineTransform(translationX: -self.frame.width + 16, y: 0)
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: [.allowUserInteraction , .curveEaseInOut], animations: {
            cell.transform = .identity
        }, completion: nil)
    }
}

