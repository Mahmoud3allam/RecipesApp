//
//  RecipeDetailsViewController.swift
//  SoftExpertTask
//
//  Created Alchemist on 2/13/20.
//  Copyright © 2020 MAC. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
import SafariServices
class RecipeDetailsViewController: UIViewController, RecipeDetailsViewProtocol {
    var presenter: RecipeDetailsPresenterProtocol!
    lazy var mainView : RecipeDetailsContailer = {
       var view = RecipeDetailsContailer()
        return view
    }()
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter.viewDidLoad()
        self.bindPublisherButton()
    }
    func setupNavigationTitle(title: String) {
        self.title = title
    }
    func setupRecipeImage(image: String) {
        self.mainView.recipeImage = image
    }
    func setupRecipeUrl(stringUrl: String) {
        self.mainView.publisherUrl = stringUrl
    }
    func setupIngredientsTable(withData: [String]) {
        self.mainView.ingredients = withData
    }
    private func bindPublisherButton(){
        self.mainView.onPublisherTapped = { [weak self] (url) in
            guard let this = self else {return}
            this.showSafariWith(url: url)
        }
    }
    private func showSafariWith(url:String) {
        if let url = URL(string:url) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
    
}
