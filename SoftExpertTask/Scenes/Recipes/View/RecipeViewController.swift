//
//  RecipeViewController.swift
//  SoftExpertTask
//
//  Created Alchemist on 2/11/20.
//  Copyright © 2020 MAC. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class RecipeViewController: UITableViewController, RecipeViewProtocol {
    var presenter: RecipePresenterProtocol!
    lazy var searchController = UISearchController(searchResultsController: nil)
    lazy var activityIndicator : UIActivityIndicatorView = {
       var indicator = UIActivityIndicatorView()
        indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        indicator.style = .large
        indicator.color = .white
        return indicator
    }()
    lazy var searchSuggestionsView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    var suggestionViewHeight : NSLayoutConstraint?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        self.setupUiBehaviors()
        self.setupSearchController()
        self.registerTableViewCells()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.setupNavigationBarBehaviors()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.title = " "
    }
    private func setupUiBehaviors() {
        self.view.backgroundColor = .black
    }
    private func setupNavigationBarBehaviors() {
        self.title = "Recipe"
    }
    private func setupSearchController() {
        searchController.searchBar.delegate = self
        searchController.searchBar.searchTextField.textColor = .white
        navigationItem.searchController = searchController
        searchController.definesPresentationContext = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    private func showWhiteIndicator(){
        self.activityIndicator.center = self.view.center
        self.view.addSubview(self.activityIndicator)
        self.activityIndicator.startAnimating()
    }
    private func hideWhiteIndicator(){
        self.activityIndicator.stopAnimating()
        self.activityIndicator.removeFromSuperview()
    }
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func scrollToFirstIndex() {
        DispatchQueue.main.async {
            let indexPath = IndexPath(item: 0, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    func dismissSearchController() {
        self.searchController.dismiss(animated: true, completion: nil)
    }
    func showActivityIndicator() {
        //ShowIndicator
        self.view.isUserInteractionEnabled = false
        self.showWhiteIndicator()
    }
    func hideActivityIndicator() {
        //HideIndicator
        self.view.isUserInteractionEnabled = true
        self.hideWhiteIndicator()
    }
    func showError(withMsg: String) {
        print("Error Msg = \(withMsg)")
        DispatchQueue.main.async {
            self.present(self.createErrorAlert(withMsg: withMsg), animated: true, completion: nil)
        }
    }
    func createErrorAlert(withMsg:String) -> UIAlertController {
        let alert = UIAlertController(title: "Error !", message: withMsg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (alert) in
            self.dismiss(animated: true, completion: nil)
        }))
        return alert
    }
    func createHeaderBackGroundLabel()-> UILabel {
        let headerBackGroundLabel = UILabel()
        headerBackGroundLabel.backgroundColor = .clear
        headerBackGroundLabel.text = "There's No Data , Please search to refresh content"
        headerBackGroundLabel.font = R.font.proximaNovaABold(size: 20)
        headerBackGroundLabel.textAlignment = .center
        headerBackGroundLabel.numberOfLines = 2
        headerBackGroundLabel.textColor = .white
        return headerBackGroundLabel
    }
}


