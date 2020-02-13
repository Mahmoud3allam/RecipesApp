//
//  RecipeView + TableView.swift
//  SoftExpertTask
//
//  Created by Alchemist on 2/11/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit
import Rswift
extension RecipeViewController {
    func registerTableViewCells() {
        self.tableView.register(RecipeCell.self, forCellReuseIdentifier: NSStringFromClass(RecipeCell.self))
        self.tableView.register(PaginationSpinner.self, forCellReuseIdentifier: NSStringFromClass(PaginationSpinner.self))
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? presenter.numberOfRows() : 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(RecipeCell.self), for: indexPath) as? RecipeCell else {
                return UITableViewCell()
            }
            presenter.configure(recipesCell: cell, AtIndexPath: indexPath)
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(PaginationSpinner.self), for: indexPath) as? PaginationSpinner else {
                return UITableViewCell()
            }
            presenter.numberOfRows() > 0 ? cell.showPaginationIndicator() : cell.hidePaginationIndicator()
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(AtIndexPath: indexPath)
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.item == presenter.numberOfRows() - 1 {
            guard self.searchController.searchBar.text != nil , self.searchController.searchBar.text != "" else {return}
            presenter.willDisplayLastCell(keyWord: self.searchController.searchBar.text ?? "")
        }
        cell.alpha = 0
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.allowUserInteraction , .curveEaseInOut], animations: {
            cell.alpha = 1
        }, completion: nil)

    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return createHeaderBackGroundLabel()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 132 : 40
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? self.presenter.numberOfRows() > 0 ? 0 : 300 : 0
    }
}




