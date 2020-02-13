//
//  RecipeRouter.swift
//  SoftExpertTask
//
//  Created Alchemist on 2/11/20.
//  Copyright © 2020 MAC. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class RecipeRouter: RecipeRouterProtocol {
    weak var viewController: UIViewController?
    static func createAnModule() -> UIViewController {
        let interactor = RecipeInteractor()
        let router = RecipeRouter()
        let view = RecipeViewController()
        let presenter = RecipePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    func navigateToDetailsView(withRecipe: Recipe) {
        let recipesDetailsView = RecipeDetailsRouter.createAnModule(with: withRecipe)
        viewController?.navigationController?.pushViewController(recipesDetailsView, animated: true)
    }
    

}
