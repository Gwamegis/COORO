//
//  MenuData.swift
//  Selkhy
//
//  Created by Kyubo Shim on 2023/08/19.
//

import Foundation
import SwiftUI


var mockMenus: [Menu] = [
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
                     action: .fry,
                     time: "1m 30s"
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
                Cook(ingredients: [Ingredient(name: "칼국수면", image: Image("Sandwich"), isHidden: true)], action: .boil, time: "30s"),
                Cook(ingredients: [Ingredient(name: "고추장", image: Image("Sandwich"), isHidden: false)], action: .fry, time: "1m")
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
                Cook(ingredients: [Ingredient(name: "고기", image: Image("Meat"), isHidden: false), Ingredient(name: "파", image: Image("GreenOnion"), isHidden: false)], action: .roast, time: "1m")
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
                        Cook(ingredients: [Ingredient(name: "단무지", image: Image("PickledRadish"), isHidden: false)], action: .fry, time: "1m"),
                        Cook(ingredients: [Ingredient(name: "햄", image: Image("Ham"), isHidden: false)], action: .fry, time: "1m"),
                        Cook(ingredients: [Ingredient(name: "스시밥", image: Image("SushiRice"), isHidden: false)], action: .boil, time: "1m")
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
                        Cook(ingredients: [Ingredient(name: "갈비", image: Image("Rib"), isHidden: false)], action: .fry, time: "1m"),
                        Cook(ingredients: [Ingredient(name: "양파", image: Image("Onion"), isHidden: false), Ingredient(name: "당근", image: Image("Carrot"), isHidden: false)], action: .fry, time: "1m"),
                        Cook(ingredients: [Ingredient(name: "갈비찜 소스", image: Image("BraisingSauce"), isHidden: false)], action: .boil, time: "1m")
                    ]
                ),
        review: [Review(score: 10, photo: Image("Sandwich") , content: "")],
        image: Image("Meet"))
    
]

class MenuStore: ObservableObject {
    @Published var mockMenus: [Menu] = [
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
                         action: .fry,
                         time: "1m 30s"
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
                    Cook(ingredients: [Ingredient(name: "칼국수면", image: Image("Sandwich"), isHidden: true)], action: .boil, time: "30s"),
                    Cook(ingredients: [Ingredient(name: "고추장", image: Image("Sandwich"), isHidden: false)], action: .fry, time: "1m")
                ]),
            review: [Review(score: 10, photo: Image("Sandwich") , content: "")],
            image: Image("Noodle")),
        
        Menu(
            name: "여친이 시킨 꼬치",
            numberOfOrder: 10,
            creater: "중곡동백종원",
            likes: 100,
            story: "저와 여친이 첫 데이트 때 방문한 포장마차의 꼬치. 그 당시 서로 많은 이야기를 나누며 먹었던 꼬치의 맛을 잊지 못해서 집에서 재현해 보았어요.",
            recipe: Recipe(
                ingredients: [
                    Ingredient(name: "고기", image: Image("Meat"), isHidden: false),
                    Ingredient(name: "파", image: Image("GreenOnion"), isHidden: false)
                ],
                amount: [5,5],
                price: 7000,
                produce: [
                    Cook(ingredients: [Ingredient(name: "고기", image: Image("Meat"), isHidden: false), Ingredient(name: "파", image: Image("GreenOnion"), isHidden: false)], action: .roast, time: "1m")
                ]
            ),
            review: [Review(score: 10, photo: Image("Sandwich") , content: "")],
            image: Image("Skewer")),
        
        Menu(
            name: "3분 스시 김밥",
            numberOfOrder: 10,
            creater: "오마카세아니면밥상엎음",
            likes: 200,
            story: "바쁜 아침, 회사에 지각하면 안 되는 날. 그런데 배가 고팠어요. 그때 생각난 것이 이 3분 스시 김밥! 빠르게 만들어 먹고 회사에 도착한 그 느낌을 잊을 수 없어요.",
            recipe: Recipe(
                        ingredients: [
                            Ingredient(name: "단무지", image: Image("PickledRadish"), isHidden: false),
                            Ingredient(name: "햄", image: Image("Ham"), isHidden: false),
                            Ingredient(name: "스시밥", image: Image("SushiRice"), isHidden: false)
                        ],
                        amount: [3,3,6],
                        price: 5000,
                        produce: [
                            Cook(ingredients: [Ingredient(name: "단무지", image: Image("PickledRadish"), isHidden: false)], action: .fry, time: "1m"),
                            Cook(ingredients: [Ingredient(name: "햄", image: Image("Ham"), isHidden: false)], action: .fry, time: "1m"),
                            Cook(ingredients: [Ingredient(name: "스시밥", image: Image("SushiRice"), isHidden: false)], action: .boil, time: "1m")
                        ]
                    ),
            review: [Review(score: 10, photo: Image("Sandwich") , content: "")],
            image: Image("Kimbob")),
        
        Menu(
            name: "어남 선생이 또 일냈다",
            numberOfOrder: 10,
            creater: "가지는음식아님",
            likes: 50,
            story: "집에 친구들을 초대해서 파티를 열었을 때, 제일 칭찬받았던 메뉴! 어남 선생의 특별한 레시피로, 친구들은 이 음식을 먹으며 어남 선생의 실력을 다시 한번 인정하게 되었죠.",
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
                            Cook(ingredients: [Ingredient(name: "갈비", image: Image("Rib"), isHidden: false)], action: .fry, time: "1m"),
                            Cook(ingredients: [Ingredient(name: "양파", image: Image("Onion"), isHidden: false), Ingredient(name: "당근", image: Image("Carrot"), isHidden: false)], action: .fry, time: "1m"),
                            Cook(ingredients: [Ingredient(name: "갈비찜 소스", image: Image("BraisingSauce"), isHidden: false)], action: .boil, time: "1m")
                        ]
                    ),
            review: [Review(score: 10, photo: Image("Sandwich") , content: "")],
            image: Image("Meet")),
        
        Menu(
            name: "추억의 오뎅",
            numberOfOrder: 10,
            creater: "10학번화석맨",
            likes: 120,
            story: "대학생활에서 빼놓을 수 없었던 단골집 오뎅바! 동기 하나가 사라져도 모르는 그 맛을 살려냈어요.",
            recipe: Recipe(
                ingredients: [
                    Ingredient(name: "오뎅", image: Image("Odeng"), isHidden: false),
                    Ingredient(name: "떡", image: Image("RiceCake"), isHidden: false),
                    Ingredient(name: "오뎅 국물", image: Image("OdengBroth"), isHidden: false)
                ],
                amount: [4, 3, 6],
                price: 3500,
                produce: [
                    Cook(ingredients: [Ingredient(name: "오뎅", image: Image("Odeng"), isHidden: false), Ingredient(name: "떡", image: Image("RiceCake"), isHidden: false)], action: .boil, time: "2m"),
                    Cook(ingredients: [Ingredient(name: "오뎅 국물", image: Image("OdengBroth"), isHidden: false)], action: .boil, time: "5m")
                ]
            ),
            review: [Review(score: 9, photo: Image("Odeng") , content: "")],
            image: Image("Odeng")
        ),

        Menu(
            name: "하울 정식",
            numberOfOrder: 10,
            creater: "키미노나마에와",
            likes: 150,
            story: "하울정식 집에서 매일 해먹으며 황금 조리 시간을 찾았어요. 거기에 스페셜 재료까지!",
            recipe: Recipe(
                ingredients: [
                    Ingredient(name: "밥", image: Image("Rice"), isHidden: false),
                    Ingredient(name: "고기", image: Image("Meat"), isHidden: false),
                    Ingredient(name: "야채", image: Image("Veggies"), isHidden: false)
                ],
                amount: [3, 5, 4],
                price: 6500,
                produce: [
                    Cook(ingredients: [Ingredient(name: "밥", image: Image("Rice"), isHidden: false)], action: .boil, time: "10m"),
                    Cook(ingredients: [Ingredient(name: "고기", image: Image("Meat"), isHidden: false)], action: .fry, time: "5m"),
                    Cook(ingredients: [Ingredient(name: "야채", image: Image("Veggies"), isHidden: false)], action: .fry, time: "3m")
                ]
            ),
            review: [Review(score: 8, photo: Image("Haul") , content: "")],
            image: Image("Haul")
        ),

        Menu(
            name: "우정의 타코야끼",
            numberOfOrder: 10,
            creater: "렌고쿠",
            likes: 180,
            story: "친구와 일본에서 먹었던 타코야끼 맛을 잊을 수 없어요. 일본에서만 먹을 수 있었던 소스, 제가 알려드릴게요!",
            recipe: Recipe(
                ingredients: [
                    Ingredient(name: "타코야끼 반죽", image: Image("TakoyakiDough"), isHidden: false),
                    Ingredient(name: "문어", image: Image("Octopus"), isHidden: false),
                    Ingredient(name: "타코야끼 소스", image: Image("TakoyakiSauce"), isHidden: false)
                ],
                amount: [5, 3, 3],
                price: 6000,
                produce: [
                    Cook(ingredients: [Ingredient(name: "타코야끼 반죽", image: Image("TakoyakiDough"), isHidden: false), Ingredient(name: "문어", image: Image("Octopus"), isHidden: false)], action: .fry, time: "4m"),
                    Cook(ingredients: [Ingredient(name: "타코야끼 소스", image: Image("TakoyakiSauce"), isHidden: false)], action: .fry, time: "1m")
                ]
            ),
            review: [Review(score: 9, photo: Image("Takoyaki") , content: "")],
            image: Image("Takoyaki")
        ),

        Menu(
            name: "엄마 손맛 버거",
            numberOfOrder: 10,
            creater: "맥도날드덕후",
            likes: 190,
            story: "저는 미국에서 태어났고, 20살이 되자마자 한국에 왔어요. 한국살이 4년이 다 되어가지만 엄마가 만들어준 수제 버거가 가끔 떠올라요. 생각날 때마다 먹고 싶어서 엄마의 비밀 레시피를 올려봐요.",
            recipe: Recipe(
                ingredients: [
                    Ingredient(name: "버거 패티", image: Image("BurgerPatty"), isHidden: false),
                    Ingredient(name: "버거 빵", image: Image("BurgerBun"), isHidden: false),
                    Ingredient(name: "야채", image: Image("BurgerVeggies"), isHidden: false),
                    Ingredient(name: "치즈", image: Image("Cheese"), isHidden: false)
                ],
                amount: [1, 2, 2, 1],
                price: 8000,
                produce: [
                    Cook(ingredients: [Ingredient(name: "버거 패티", image: Image("BurgerPatty"), isHidden: false)], action: .fry, time: "6m"),
                    Cook(ingredients: [Ingredient(name: "야채", image: Image("BurgerVeggies"), isHidden: false)], action: .boil, time: "2m"),
                    Cook(ingredients: [Ingredient(name: "치즈", image: Image("Cheese"), isHidden: false)], action: .boil, time: "1m")
                ]
            ),
            review: [Review(score: 10, photo: Image("Burger") , content: "")],
            image: Image("Burger")
        )
        
    ]
}
