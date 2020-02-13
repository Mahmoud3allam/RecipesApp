//
//  RecipeDetailsViewController.swift
//  SoftExpertTask
//
//  Created Alchemist on 2/13/20.
//  Copyright © 2020 MAC. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class RecipeDetailsViewController: UIViewController, RecipeDetailsViewProtocol {
    var presenter: RecipeDetailsPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
