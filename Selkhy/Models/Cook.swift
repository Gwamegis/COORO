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
    
    var actionTitle: String {
        switch self {
        case .fry:
            return "튀기기"
        case .boil:
            return "끓이기"
        case .roast:
            return "볶기"
        case .steam:
            return "찌기"
        }
    }
}

struct Cook: Identifiable {
    var id = UUID()
    var ingredients: [Ingredient]?
    var action: CookAction?
    var time: String?
}
