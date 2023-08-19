//
//  Cook.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/19.
//

import SwiftUI

enum CookAction {
    case fry
    case boil
    case roast
    case steam
    
    func getImage() -> Image {
        switch self {
        case .fry:
            return Image("FriButton")
        case .boil:
            return Image("BoilButton")
        case .roast:
            return Image("RoastButton")
        case .steam:
            return Image("SteamButton")
        }
    }
}

struct Cook {
    var ingredients: [Ingredient]?
    var action: CookAction
    var time: String
}
