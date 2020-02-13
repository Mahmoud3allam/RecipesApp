//
//  RecipeCell.swift
//  SoftExpertTask
//
//  Created by Alchemist on 2/11/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit
import Rswift
import Kingfisher
class RecipeCell : UITableViewCell {
    lazy var recipeImage: UIImageView = {
        var iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .gray
        iv.image = R.image.freshhhhhh()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.kf.indicatorType = .activity
        return iv
    }()
    lazy var stackView: UIStackView = {
        var infoStack = UIStackView()
        infoStack.distribution = .fill
        infoStack.axis = .vertical
        infoStack.alignment = .fill
        infoStack.spacing = 2
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        return infoStack
    }()
    lazy var recipeName: UILabel = {
        var nameLabel = UILabel()
        nameLabel.text = "Recipe Name"
        nameLabel.numberOfLines = 2
        nameLabel.textColor = .white
        nameLabel.font = R.font.proximaNovaABold(size: 17)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    lazy var recipeSource: UILabel = {
        var sourceLabel = UILabel()
        sourceLabel.text = "Recipe Source"
        sourceLabel.textColor = .white
        sourceLabel.font = R.font.proximaNovaABold(size: 14)
        sourceLabel.translatesAutoresizingMaskIntoConstraints = false
        return sourceLabel
    }()
    lazy var recipeHealthLabel: UILabel = {
        var healthLabel = UILabel()
        healthLabel.text = "Healeth label"
        healthLabel.font = R.font.proximaNovaARegular(size: 12)
        healthLabel.numberOfLines = 0
        healthLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        healthLabel.translatesAutoresizingMaskIntoConstraints = false
        return healthLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCellBehaviors()
        self.layoutUserInterface()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func layoutUserInterface() {
        self.addSubViews()
        self.setupRecipeImage()
        self.setupStackView()
        self.addArrangedViews()
    }
    private func addSubViews() {
        self.addSubview(self.recipeImage)
        self.addSubview(self.stackView)
    }
    private func setupRecipeImage() {
        NSLayoutConstraint.activate([
            self.recipeImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            self.recipeImage.heightAnchor.constraint(equalToConstant: 100),
            self.recipeImage.widthAnchor.constraint(equalToConstant: 100),
            self.recipeImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)
        ])
    }
    private func setupStackView() {
        NSLayoutConstraint.activate([
            self.stackView.leftAnchor.constraint(equalTo: self.recipeImage.rightAnchor, constant: 8),
            self.stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            self.stackView.centerYAnchor.constraint(equalTo: self.recipeImage.centerYAnchor, constant: 0),
            self.stackView.heightAnchor.constraint(lessThanOrEqualToConstant: 100)
        ])
    }
    private func addArrangedViews(){
        self.stackView.addArrangedSubview(self.recipeName)
        self.stackView.addArrangedSubview(self.recipeSource)
        self.stackView.addArrangedSubview(self.recipeHealthLabel)
    }
    private func setupCellBehaviors() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
}


extension RecipeCell : RecipesCellView {
    func configureRecipeCell(recipe: Hits) {
        if let unwrappedRecipe = recipe.recipe {
            recipeName.text = unwrappedRecipe.label ?? "No Name"
            recipeSource.text = unwrappedRecipe.source ?? "No Source"
            self.recipeImage.kf.setImage(with: URL(string: unwrappedRecipe.image ?? ""))
            let reipeHealthText = unwrappedRecipe.healthLabels?.reduce("", {$0 + $1 + " - " })
            self.recipeHealthLabel.text = reipeHealthText
        }
    }
}
