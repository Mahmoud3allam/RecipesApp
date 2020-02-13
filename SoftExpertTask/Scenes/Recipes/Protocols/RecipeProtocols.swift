//
//  RecipeProtocols.swift
//  SoftExpertTask
//
//  Created Alchemist on 2/11/20.
//  Copyright © 2020 MAC. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
protocol RecipeViewProtocol: class {
    var presenter: RecipePresenterProtocol! {get set}
    func showActivityIndicator()
    func hideActivityIndicator()
    func reloadTableView()
    func scrollToFirstIndex()
    func dismissSearchController()
    func showError(withMsg: String)
}
protocol RecipePresenterProtocol {
    var view: RecipeViewProtocol? {get set}
    func viewDidLoad()
    func searchData(withKeyWord:String)
    func clearDataSourceOnCancel()
    func numberOfRows() -> Int
    func configure(recipesCell cell:RecipesCellView ,AtIndexPath indexPath : IndexPath)
    func willDisplayLastCell(keyWord:String)
    func didSelect(AtIndexPath indexPath: IndexPath)
}
protocol RecipeInteractorInPutProtocol {
    var presenter: RecipeInteractorOutPutProtocol? {get set}
    func searchRecipe(withKeyWord: String, fromPage: Int, toPage: Int)
    func loadMore(withKeyWord: String, fromPage: Int, toPage: Int)
}
protocol RecipeInteractorOutPutProtocol {
    func fetchedRecipeSucsessfully(recipes : [Hits])
    func failedToFetchRecipes(stringError err: String)
    func getLastIndex(index:Int)
    func fetchedMoreRecipes(newRecipes:[Hits])
}
protocol RecipesCellView {
    func configureRecipeCell(recipe:Hits)
}
protocol RecipeRouterProtocol {
    func navigateToDetailsView(withRecipe : Recipe)
}
