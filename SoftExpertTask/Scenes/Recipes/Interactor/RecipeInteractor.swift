//
//  RecipeInteractor.swift
//  SoftExpertTask
//
//  Created Alchemist on 2/11/20.
//  Copyright © 2020 MAC. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
class RecipeInteractor: RecipeInteractorInPutProtocol {
    var presenter: RecipeInteractorOutPutProtocol?
    func searchRecipe(withKeyWord: String, fromPage: Int, toPage: Int) {
        let url = Constants.shared.baseUrl + "q=\(withKeyWord)&" + "app_id=\(Constants.shared.appID)&" + "app_key=\(Constants.shared.appKey)&" + "from=\(fromPage)&" + "to=\(toPage)"
        DispatchQueue.global(qos: .userInteractive).async {
            NetworkLayer.instanse.fetchData(url: url) { (recipes: RecipeModel?, _ err: Error?) in
                guard err == nil else {
                    self.presenter?.failedToFetchRecipes(stringError: "Server Error")
                    return
                }
                if let unwrappedRecipes = recipes {
                    if let recipeHits = unwrappedRecipes.hits {
                        self.presenter?.getLastIndex(index:unwrappedRecipes.to ?? 0)
                        self.presenter?.fetchedRecipeSucsessfully(recipes: recipeHits)
                    }else{
                        self.presenter?.failedToFetchRecipes(stringError: "Failed to get Hits")
                    }
                }else{
                    self.presenter?.failedToFetchRecipes(stringError: "Failed to get Recipes")
                }
            }
        }
    }
    
    func loadMore(withKeyWord: String, fromPage: Int, toPage: Int) {
        let url = Constants.shared.baseUrl + "q=\(withKeyWord)&" + "app_id=\(Constants.shared.appID)&" + "app_key=\(Constants.shared.appKey)&" + "from=\(fromPage)&" + "to=\(toPage)"
        DispatchQueue.global(qos: .userInteractive).async {
            NetworkLayer.instanse.fetchData(url: url) { (recipes: RecipeModel?, _ err: Error?) in
                guard err == nil else {
                    self.presenter?.failedToFetchRecipes(stringError: "Server Error")
                    return
                }
                if let unwrappedRecipes = recipes {
                    if let recipeHits = unwrappedRecipes.hits {
                        self.presenter?.getLastIndex(index:unwrappedRecipes.to ?? 0)
                        self.presenter?.fetchedMoreRecipes(newRecipes: recipeHits)
                    }else{
                        self.presenter?.failedToFetchRecipes(stringError: "Failed to get More Hits , Due the Throttling 5 search / Min (Try after few seconds)")
                    }
                }else{
                    self.presenter?.failedToFetchRecipes(stringError: "Failed to get More Recipes ")
                }
            }
        }
    }
    
    
}
