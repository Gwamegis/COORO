//
//  Food.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/19.
//

import SwiftUI

struct Ingredient: Identifiable {
    var id = UUID().uuidString
    var name: String
    var image: Image
    var isHidden: Bool
}
