//
//  MenuData.swift
//  Selkhy
//
//  Created by Kyubo Shim on 2023/08/19.
//

import Foundation

import SwiftUI

let mockMenus: [Menu] = [
    Menu(
        name: "전남친 샌드위치",
        numberOfOrder: 10,
        story: "전남친만의 비밀 재료가 들어간 샌드위치!\n이것 대문에 다시 연락했어요.",
        recipe: Recipe(
            ingredients: [
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: true),
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
            ],
            amount: [3,6,2],
            price: 3500 ),
        review: Review(score: 10, photo: Image("sandwich") , content: ""),
        image: Image("Sandwich")),
    
    Menu(
        name: "엄마 손맛 칼국수",
        numberOfOrder: 10,
        story: "전남친만의 비밀 재료가 들어간 샌드위치!\n이것 대문에 다시 연락했어요.",
        recipe: Recipe(
            ingredients: [
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: true),
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
            ],
            amount: [3,6,2],
            price: 12000 ),
        review: Review(score: 10, photo: Image("sandwich") , content: ""),
        image: Image("Noodle")),
    
    Menu(
        name: "여친이 시킨 꼬치",
        numberOfOrder: 10,
        story: "전남친만의 비밀 재료가 들어간 샌드위치!\n이것 대문에 다시 연락했어요.",
        recipe: Recipe(
            ingredients: [
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: true),
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
            ],
            amount: [3,6,2],
            price: 7000 ),
        review: Review(score: 10, photo: Image("sandwich") , content: ""),
        image: Image("Skewer")),
    
    Menu(
        name: "김밥",
        numberOfOrder: 10,
        story: "전남친만의 비밀 재료가 들어간 샌드위치!\n이것 대문에 다시 연락했어요.",
        recipe: Recipe(
            ingredients: [
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: true),
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
            ],
            amount: [3,6,2],
            price: 5000 ),
        review: Review(score: 10, photo: Image("sandwich") , content: ""),
        image: Image("Kimbob")),
    
    Menu(
        name: "어남 선생이 또 일냈다",
        numberOfOrder: 10,
        story: "전남친만의 비밀 재료가 들어간 샌드위치!\n이것 대문에 다시 연락했어요.",
        recipe: Recipe(
            ingredients: [
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: true),
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
            ],
            amount: [3,6,2],
            price: 9000 ),
        review: Review(score: 10, photo: Image("sandwich") , content: ""),
        image: Image("Meet"))
    
]
