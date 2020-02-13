//
//  RecipeDetailsContainer.swift
//  SoftExpertTask
//
//  Created by Alchemist on 2/13/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit
import Rswift
import Kingfisher
class RecipeDetailsContailer : UIView {
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy var containerView : UIView = {
        var container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .clear
        return container
    }()
    lazy var recipeImageView : UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .gray
        image.layer.cornerRadius = 14
        image.kf.indicatorType = .activity
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    lazy var publisherButton : UIButton = {
        var bu = UIButton()
        bu.translatesAutoresizingMaskIntoConstraints = false
        bu.setTitle("", for: .normal)
        bu.setTitleColor(.systemBlue, for: .normal)
        bu.contentVerticalAlignment = .center
        bu.contentHorizontalAlignment = .left
        bu.titleLabel?.font = R.font.proximaNovaABold(size: 20)
        bu.clipsToBounds = true
        bu.titleLabel?.numberOfLines = 2
        return bu
    }()
    lazy var ingredientsTableView : UITableView = {
        var tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        return tableView
    }()
    var containerHeight : NSLayoutConstraint?
    var recipeImage:String = "" {
        didSet {
            DispatchQueue.main.async {
                self.recipeImageView.kf.setImage(with: URL(string: self.recipeImage))
            }
        }
    }
    var publisherUrl :String = "" {
        didSet {
            DispatchQueue.main.async {
                self.publisherButton.setTitle(self.publisherUrl, for: .normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        self.layOutUserInterface()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func layOutUserInterface(){
        self.addSubViews()
        self.setupScrollView()
        self.setupContainerView()
        self.setupRecipeImage()
        self.setupPublisherButton()
        self.setupIngredientsTableView()
    }
    private func addSubViews(){
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.containerView)
        self.containerView.addSubview(self.recipeImageView)
        self.containerView.addSubview(self.publisherButton)
        self.containerView.addSubview(self.ingredientsTableView)
    }
    
    private func setupScrollView(){
        // constrain the scroll view to 8-pts on each side
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo:  self.topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    private func setupContainerView(){
        containerView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: 0).isActive = true
        containerView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 0).isActive = true
        containerView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1).isActive = true
        self.containerHeight = containerView.heightAnchor.constraint(equalToConstant: 2000)
        self.containerHeight?.isActive = true
    }
    private func setupRecipeImage(){
        NSLayoutConstraint.activate([
            self.recipeImageView.topAnchor.constraint(equalTo: self.containerView.topAnchor,constant: 16),
            self.recipeImageView.leftAnchor.constraint(equalTo: self.containerView.leftAnchor,constant: 16),
            self.recipeImageView.rightAnchor.constraint(equalTo: self.containerView.rightAnchor,constant: -16),
            self.recipeImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    private func setupPublisherButton() {
        NSLayoutConstraint.activate([
            self.publisherButton.leftAnchor.constraint(equalTo: self.recipeImageView.leftAnchor, constant: 16),
            self.publisherButton.rightAnchor.constraint(equalTo: self.recipeImageView.rightAnchor, constant: -16),
            self.publisherButton.bottomAnchor.constraint(equalTo: self.recipeImageView.bottomAnchor, constant: -16)
        ])
    }
    private func setupIngredientsTableView(){
        self.ingredientsTableView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -32).isActive = true
        ingredientsTableView.topAnchor.constraint(equalTo:  self.recipeImageView.bottomAnchor, constant: 8).isActive = true
        ingredientsTableView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 32).isActive = true
        ingredientsTableView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: 0).isActive = true
    }
    func calculateScrollHeight(){
        self.ingredientsTableView.allowsSelection = false
        self.containerHeight?.isActive = false
        self.containerHeight?.constant = self.ingredientsTableView.contentSize.height + 200 + 16 + 8
        self.containerHeight?.isActive = true
        self.layoutIfNeeded()
    }
}

extension RecipeDetailsContailer : UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let ingredientsCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath) as? UITableViewCell else {return UITableViewCell()}
        ingredientsCell.backgroundColor = .clear
        ingredientsCell.textLabel?.textColor = .white
        ingredientsCell.textLabel?.text = "ingredient" + "\(indexPath.item)"
        ingredientsCell.textLabel?.font = R.font.proximaNovaARegular(size: 20)
        return ingredientsCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let ingredientsHeaderView = IngredientsHeaderView()
        return ingredientsHeaderView
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.item == 9 {
            self.calculateScrollHeight()
        }
    }
    
}

class IngredientsHeaderView : UIView {
    let headerLabel : UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = R.font.proximaNovaBold(size: 25)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "ingredients"
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.layoutUserInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addSubViews(){
        self.addSubview(self.headerLabel)
    }
    private func layoutUserInterface(){
        self.addSubViews()
        self.setupHeaderLabel()
    }
    
    private func setupHeaderLabel() {
        NSLayoutConstraint.activate([
            self.headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            self.headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            self.headerLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            self.headerLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)
        ])
    }
}
