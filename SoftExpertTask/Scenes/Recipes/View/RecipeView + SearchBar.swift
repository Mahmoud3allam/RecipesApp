//
//  RecipeView + SearchBar.swift
//  SoftExpertTask
//
//  Created by Alchemist on 2/12/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit
extension RecipeViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let unwrappedKeyWord = searchBar.text {
            presenter.searchData(withKeyWord: unwrappedKeyWord)
        }
    }
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        presenter.clearDataSourceOnCancel()
    }
}
