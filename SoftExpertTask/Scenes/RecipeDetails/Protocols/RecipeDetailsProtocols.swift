//
//  RecipeDetailsProtocols.swift
//  SoftExpertTask
//
//  Created Alchemist on 2/13/20.
//  Copyright © 2020 MAC. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
protocol RecipeDetailsViewProtocol: class {
    var presenter: RecipeDetailsPresenterProtocol! {get set}
    func setupNavigationTitle(title:String)
    func setupRecipeImage(image:String)
    func setupRecipeUrl(stringUrl:String)
    func setupIngredientsTable(withData:[String])
}
protocol RecipeDetailsPresenterProtocol {
    var view: RecipeDetailsViewProtocol? {get set}
    func viewDidLoad()
}
protocol RecipeDetailsRouterProtocol {
}
protocol RecipeDetailsInteractorInPutProtocol {
    var presenter: RecipeDetailsInteractorOutPutProtocol? {get set}
}
protocol RecipeDetailsInteractorOutPutProtocol {
}
