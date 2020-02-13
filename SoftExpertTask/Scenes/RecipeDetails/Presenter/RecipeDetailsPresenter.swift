//
//  RecipeDetailsPresenter.swift
//  SoftExpertTask
//
//  Created Alchemist on 2/13/20.
//  Copyright © 2020 MAC. All rights reserved.
//
//@Mahmoud Allam Templete ^_^

import Foundation
class RecipeDetailsPresenter: RecipeDetailsPresenterProtocol, RecipeDetailsInteractorOutPutProtocol {
    weak var view: RecipeDetailsViewProtocol?
    private let interactor: RecipeDetailsInteractorInPutProtocol
    private let router: RecipeDetailsRouterProtocol
    var recipe : Recipe?
    init(view: RecipeDetailsViewProtocol, interactor: RecipeDetailsInteractorInPutProtocol, router: RecipeDetailsRouterProtocol , recipe : Recipe) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.recipe = recipe
    }
    func viewDidLoad() {
        if let unwrappedRecipe = recipe {
            if let title = unwrappedRecipe.label {
                view?.setupNavigationTitle(title: title)
            }
            if let image = unwrappedRecipe.image {
                view?.setupRecipeImage(image: image)
            }
            if let publisherUrl = unwrappedRecipe.shareAs {
                view?.setupRecipeUrl(stringUrl: publisherUrl)
            }
            if let ingredients = unwrappedRecipe.ingredientLines {
                view?.setupIngredientsTable(withData: ingredients)
            }
        }
    }
}
