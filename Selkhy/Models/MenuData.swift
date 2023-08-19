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
        creater: "스윗쿡남",
        likes: 300,
        story: "전남친만의 비밀 재료가 들어간 샌드위치!\n이것 때문에 다시 연락했어요.",
        recipe: Recipe(
            ingredients: [
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
                Ingredient(name: "크림치즈", image: Image("Sandwich"), isHidden: true),
                Ingredient(name: "블루베리잼", image: Image("Sandwich"), isHidden: true),
                Ingredient(name: "머스타드", image: Image("Sandwich"), isHidden: false),
                Ingredient(name: "햄", image: Image("Sandwich"), isHidden: false),
                Ingredient(name: "슬라이스 치즈", image: Image("Sandwich"), isHidden: false),
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
            ],
            amount: [3,6,2],
            price: 3500 ),
        review: [Review(score: 10, photo: Image("Sandwich") , content: "직접 픽업해서 먹었는데, 1위인 이유가 있네요."), Review(score: 10, content: "직접 픽업해서 먹었는데, 1위인 이유가 있네요.")],
        image: Image("Sandwich")),
    
    Menu(
        name: "엄마 손맛 칼국수",
        numberOfOrder: 10,
        creater: "눈물의 곡절",
        likes: 500,
        story: "지난 해에 어머니가 돌아가셨어요.\n어머니의 손길이 묻어있는 마지막 레시피",
        recipe: Recipe(
            ingredients: [
                Ingredient(name: "칼국수면", image: Image("Sandwich"), isHidden: true),
                Ingredient(name: "멸치육수", image: Image("Sandwich"), isHidden: false),
                Ingredient(name: "고추장", image: Image("Sandwich"), isHidden: false),
            ],
            amount: [3,6,2],
            price: 12000 ),
        review: [Review(score: 10, photo: Image("Sandwich") , content: "")],
        image: Image("Noodle")),
    
    Menu(
        name: "여친이 시킨 꼬치",
        numberOfOrder: 10,
        creater: "중곡동백종원",
        likes: 100,
        story: "전남친만의 비밀 재료가 들어간 샌드위치!\n이것 대문에 다시 연락했어요.",
        recipe: Recipe(
            ingredients: [
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: true),
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
            ],
            amount: [3,6,2],
            price: 7000 ),
        review: [Review(score: 10, photo: Image("Sandwich") , content: "")],
        image: Image("Skewer")),
    
    Menu(
        name: "3분 스시 김밥",
        numberOfOrder: 10,
        creater: "오마카세아니면밥상엎음",
        likes: 200,
        story: "전남친만의 비밀 재료가 들어간 샌드위치!\n이것 대문에 다시 연락했어요.",
        recipe: Recipe(
            ingredients: [
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: true),
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
            ],
            amount: [3,6,2],
            price: 5000 ),
        review: [Review(score: 10, photo: Image("Sandwich") , content: "")],
        image: Image("Kimbob")),
    
    Menu(
        name: "어남 선생이 또 일냈다",
        numberOfOrder: 10,
        creater: "가지는음식아님",
        likes: 50,
        story: "전남친만의 비밀 재료가 들어간 샌드위치!\n이것 대문에 다시 연락했어요.",
        recipe: Recipe(
            ingredients: [
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: true),
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
            ],
            amount: [3,6,2],
            price: 9000 ),
        review: [Review(score: 10, photo: Image("Sandwich") , content: "")],
        image: Image("Meet"))
    
]
