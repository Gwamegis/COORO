//
//  Cook.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/19.
//

import Foundation

enum CookAction {
    case fry
    case boil
    case roast
}

struct Cook {
    var ingredients: [Ingredient]?
    var action: CookAction
}
