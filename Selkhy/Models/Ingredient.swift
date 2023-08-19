//
//  Food.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/19.
//

import SwiftUI

struct Ingredient: Identifiable, Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name.hashValue)
    }
    var id = UUID()
    var name: String
    var image: Image
    var isHidden: Bool
}

class IngredientList {
    static let shared = IngredientList()

    // 재료 리스트들
    let vegetables: [(name: String, english: String)] = [
        ("당근", "carrot"),
        ("대파", "greenOnion"),
        ("양파", "onion"),
        ("가지", "eggplant"),
        ("고추", "chili"),
        ("마늘", "garlic"),
        ("감자", "potato"),
        ("김치", "kimchi")
    ]
    let meats: [(name: String, english: String)] = [
        ("갈비살", "ribeye"),
        ("삼겹살", "porkBelly"),
        ("목살", "neckMeat"),
        ("베이컨", "bacon")
    ]
    let dairy: [(name: String, english: String)] = [
        ("계란", "egg"),
        ("우유", "milk"),
        ("요거트", "yogurt"),
        ("치즈", "cheese")
    ]
    let grain: [(name: String, english: String)] = [
        ("쌀밥", "rice"),
        ("땅콩", "peanut")
    ]

    private init() {}
}
