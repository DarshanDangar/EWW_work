//
//  File.swift
//  Categories
//
//  Created by Darshan Dangar on 08/08/23.
//

import UIKit

struct CategoriesModel {
    let imgCategories: String = "cleaning"
    let categoriesName: String
    var subList: [CategoriesModel] = []
    
    init(categoriesName: String, subList: [CategoriesModel] = []) {
        self.categoriesName = categoriesName
        self.subList = subList
    }
    
    static let categoryList: [CategoriesModel] = [ .init(categoriesName: "All"),
                                                   .init(categoriesName: "Cleaning", subList: getList(name: "Cleaning")),
                                                   .init(categoriesName: "Ac Repair", subList: getList(name: "Ac Repair")),
                                                   .init(categoriesName: "Tv Repair", subList: getList(name: "Tv Repair")),
                                                   .init(categoriesName: "Mobile Repair", subList: getList(name: "Mobile Repair")),
                                                   .init(categoriesName: "Home Decore", subList: getList(name: "Home Decore")),
                                                   .init(categoriesName: "Garden Cleaning", subList: getList(name: "Garden Cleaning")),
                                                   .init(categoriesName: "Office", subList: getList(name: "Office")),
                                                   .init(categoriesName: "Laptop Repair", subList: getList(name: "Laptop Repair")),
                                                   .init(categoriesName: "Real Estate", subList: getList(name: "Real Estate"))]
}

func getList(name: String) -> [CategoriesModel] {
    return Array(1...10).map({CategoriesModel(categoriesName: name + $0.description)})
}
