//
//  RankingView.swift
//  Selkhy
//
//  Created by Kyubo Shim on 2023/08/19.
//

import SwiftUI

struct RankingView: View {
    let menus: [Menu] = [
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

        var body: some View {
            VStack(alignment: .leading) {
                Image("AppLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                
                HStack{
                    Image("Crown")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                    Text("8월 3째주 쿠로 랭킹")
                    Spacer()
                }
                ZStack{
                    Color.red
                    VStack{
                        menus[0].image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                        VStack{
                            HStack{
                                Text(menus[0].name)
                                Text("\(menus[0].recipe.price, specifier: "%.0f")원")
                            }
                            Text("설명 솰라솰라")
                        }
                    }
                }
                .cornerRadius(30)
                
                Text("이번주 랭킹")
                List {
                    ForEach(1 ..< menus.count) { index in
                        RankingCell(rank: index + 1, menu: menus[index])
                            .listRowInsets(EdgeInsets())
                    }
                }
                .listStyle(.plain)
            }
            .padding(.horizontal, 20)
        }
}

struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView()
    }
}


struct RankingCell: View {
    var rank: Int
    var menu: Menu

    var body: some View {
        HStack {
            Text("\(rank)")
                .font(.headline)
            
            menu.image  // 첫 번째 재료의 이미지를 사용
            // Image(systemName: "chevron.down")
                .resizable()
                .frame(width: 90, height: 70)
                .clipShape(Circle())
            
            
            VStack(alignment: .leading) {
                Text(menu.name)
                Text("\(menu.recipe.price, specifier: "%.0f")원")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
