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
