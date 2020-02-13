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
    init(view: RecipeDetailsViewProtocol, interactor: RecipeDetailsInteractorInPutProtocol, router: RecipeDetailsRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func viewDidLoad() {
        print("ViewDidLoad")

    }
}
