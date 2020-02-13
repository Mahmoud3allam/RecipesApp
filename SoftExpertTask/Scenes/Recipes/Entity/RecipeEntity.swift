//
//  RecipeEntity.swift
//  SoftExpertTask
//
//  Created Alchemist on 2/11/20.
//  Copyright © 2020 MAC. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
class RecipeModel: Codable {
    //Scene Main Model..
    let q : String?
    let from : Int?
    let to : Int?
    let more : Bool?
    let count : Int?
    let hits: [Hits]?
}

struct Hits: Codable{
    let recipe: Recipe?
    let bookmarked, bought: Bool?
}

struct Recipe: Codable {
    let image: String?
    let label: String?
    let shareAs: String?
    let source: String?
    let healthLabels: [String]?
    let ingredientLines : [String]?
}
