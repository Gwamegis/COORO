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
                Ingredient(name: "빵", image: Image("Bread"), isHidden: false),
                Ingredient(name: "블루베리잼", image: Image("Jam"), isHidden: true),
            ],
            amount: [2, 1],  // 2개의 빵과 1개의 블루베리잼을 사용한다고 가정
            price: 3500,
            produce: [
                Cook(ingredients: [Ingredient(name: "빵", image: Image("Bread"), isHidden: false),
                                   Ingredient(name: "블루베리잼", image: Image("Jam"), isHidden: true)],
                     action: .fry
                )
            ]
        ),
        review: [Review(score: 10, photo: Image("Sandwich"), content: "직접 픽업해서 먹었는데, 1위인 이유가 있네요."), Review(score: 10, content: "직접 픽업해서 먹었는데, 1위인 이유가 있네요.")],
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
            price: 12000,
            produce: [
                Cook(ingredients: [Ingredient(name: "칼국수면", image: Image("Sandwich"), isHidden: true)], action: .boil),
                Cook(ingredients: [Ingredient(name: "고추장", image: Image("Sandwich"), isHidden: false)], action: .fry)
            ]),
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
                Ingredient(name: "고기", image: Image("Meat"), isHidden: false),
                Ingredient(name: "파", image: Image("GreenOnion"), isHidden: false)
            ],
            amount: [5,5],
            price: 7000,
            produce: [
                Cook(ingredients: [Ingredient(name: "고기", image: Image("Meat"), isHidden: false), Ingredient(name: "파", image: Image("GreenOnion"), isHidden: false)], action: .roast)
            ]
        ),
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
                        Ingredient(name: "단무지", image: Image("PickledRadish"), isHidden: false),
                        Ingredient(name: "햄", image: Image("Ham"), isHidden: false),
                        Ingredient(name: "스시밥", image: Image("SushiRice"), isHidden: false)
                    ],
                    amount: [3,3,6],
                    price: 5000,
                    produce: [
                        Cook(ingredients: [Ingredient(name: "단무지", image: Image("PickledRadish"), isHidden: false)], action: .fry),
                        Cook(ingredients: [Ingredient(name: "햄", image: Image("Ham"), isHidden: false)], action: .fry),
                        Cook(ingredients: [Ingredient(name: "스시밥", image: Image("SushiRice"), isHidden: false)], action: .boil)
                    ]
                ),
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
                        Ingredient(name: "갈비", image: Image("Rib"), isHidden: false),
                        Ingredient(name: "양파", image: Image("Onion"), isHidden: false),
                        Ingredient(name: "당근", image: Image("Carrot"), isHidden: false),
                        Ingredient(name: "갈비찜 소스", image: Image("BraisingSauce"), isHidden: false)
                    ],
                    amount: [6,2,2,4],
                    price: 9000,
                    produce: [
                        Cook(ingredients: [Ingredient(name: "갈비", image: Image("Rib"), isHidden: false)], action: .fry),
                        Cook(ingredients: [Ingredient(name: "양파", image: Image("Onion"), isHidden: false), Ingredient(name: "당근", image: Image("Carrot"), isHidden: false)], action: .fry),
                        Cook(ingredients: [Ingredient(name: "갈비찜 소스", image: Image("BraisingSauce"), isHidden: false)], action: .boil)
                    ]
                ),
        review: [Review(score: 10, photo: Image("Sandwich") , content: "")],
        image: Image("Meet"))
    
]

//
//[[
//    Selkhy.Ingredient(id: 5A606BE6-AFB7-4D1A-A1F6-0B59ADBA7A2E, name: "토마토", image: SwiftUI.Image(provider: SwiftUI.ImageProviderBox<SwiftUI.Image.NamedImageProvider>), isHidden: false),
//  Selkhy.Ingredient(id: ED99252F-A98D-4F18-A7C8-8466EA01D3D7, name: "크림치즈", image: SwiftUI.Image(provider: SwiftUI.ImageProviderBox<SwiftUI.Image.NamedImageProvider>), isHidden: true),
//  Selkhy.Ingredient(id: 8F70C87C-3CED-48A5-84E5-695A9CDCAF46, name: "블루베리잼", image: SwiftUI.Image(provider: SwiftUI.ImageProviderBox<SwiftUI.Image.NamedImageProvider>), isHidden: true)
//],
// 
// [
//    Selkhy.Ingredient(id: EF6A35B4-12A3-4455-9E1F-72A652BC64BF, name: "머스타드", image: SwiftUI.Image(provider: SwiftUI.ImageProviderBox<SwiftUI.Image.NamedImageProvider>), isHidden: false), Selkhy.Ingredient(id: 0412F60F-EA59-4A61-8928-D8A29527B962, name: "햄", image: SwiftUI.Image(provider: SwiftUI.ImageProviderBox<SwiftUI.Image.NamedImageProvider>), isHidden: false), Selkhy.Ingredient(id: 021406A9-9B59-4BA2-86CE-2D25A9C00774, name: "슬라이스 치즈", image: SwiftUI.Image(provider: SwiftUI.ImageProviderBox<SwiftUI.Image.NamedImageProvider>), isHidden: false), Selkhy.Ingredient(id: 77609BBB-5AB0-40F4-9E11-9FCD41D50187, name: "토마토", image: SwiftUI.Image(provider: SwiftUI.ImageProviderBox<SwiftUI.Image.NamedImageProvider>), isHidden: false)]]
