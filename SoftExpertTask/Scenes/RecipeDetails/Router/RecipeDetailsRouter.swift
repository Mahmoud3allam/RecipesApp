//
//  RecipeDetailsRouter.swift
//  SoftExpertTask
//
//  Created Alchemist on 2/13/20.
//  Copyright © 2020 MAC. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class RecipeDetailsRouter: RecipeDetailsRouterProtocol {
    weak var viewController: UIViewController?
    static func createAnModule(with Recipe: Recipe) -> UIViewController {
        let interactor = RecipeDetailsInteractor()
        let router = RecipeDetailsRouter()
        let view = RecipeDetailsViewController()
        let presenter = RecipeDetailsPresenter(view: view, interactor: interactor, router: router, recipe: Recipe)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
