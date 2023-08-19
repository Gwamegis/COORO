//
//  RankingView.swift
//  Selkhy
//
//  Created by Kyubo Shim on 2023/08/19.
//

import SwiftUI

struct RankingView: View {
    let recipes: [Recipe] = [
            Recipe(ingredients: [Food(name: "전 남친 샌드위치", image: UIImage(named: "Sandwich")!)], amount: [1], price: 10000),
            Recipe(ingredients: [Food(name: "엄마 손맛 칼국수", image: UIImage(named: "Noodle")!)], amount: [2], price: 12000),
            Recipe(ingredients: [Food(name: "여친이 시킨 꼬치", image: UIImage(named: "Skewer")!)], amount: [3], price: 7000),
            Recipe(ingredients: [Food(name: "김밥", image: UIImage(named: "Kimbob")!)], amount: [1], price: 5000),
            Recipe(ingredients: [Food(name: "어남 선생이 또 일냈다", image: UIImage(named: "Meet")!)], amount: [1], price: 9000)
        ]

        var body: some View {
            ZStack{
                Color("Background")
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    HStack{
                        Image("AppLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .padding(.bottom, 30)
                        
                        
                    }
                    
                    HStack{
                        Image("Crown")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                        Text("이번주 요리")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color("LightGrey"))
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {  // HStack을 사용하여 요소들이 수평 방향으로 배열되도록 합니다.
                            ForEach(recipes.indices, id: \.self) { index in
                                ZStack {
                                    Color.red
                                    VStack {
                                        Image(uiImage: recipes[index].ingredients[0].image)
                                            .resizable()
                                            .frame(width: 280, height: 200)
                                        VStack {
                                            HStack {
                                                Text(recipes[index].ingredients[0].name)
                                                Text("\(recipes[index].price, specifier: "%.0f")원")
                                            }
                                            Text("설명 솰라솰라")
                                        }
                                    }
                                }
                                .frame(width: 320, height: 320)
                                .cornerRadius(10)
                            }
                        }
                    }
                    
                    
                    Text("이번주 랭킹")
                    List {
                        ForEach(1 ..< recipes.count) { index in
                            RankingCell(rank: index + 1, recipe: recipes[index])
                                .listRowInsets(EdgeInsets())
                        }
                        .listRowBackground(Color("Background"))
                    }
                    .listStyle(.plain)
                }
                .padding(.horizontal, 20)
            }
        }
}

struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView()
    }
}


struct RankingCell: View {
    var rank: Int
    var recipe: Recipe

    var body: some View {
        HStack {
            Text("\(rank)")
                .font(.headline)
            
            Image(uiImage: recipe.ingredients[0].image)  // 첫 번째 재료의 이미지를 사용
            // Image(systemName: "chevron.down")
                .resizable()
                .frame(width: 90, height: 70)
                .clipShape(Circle())
            
            
            VStack(alignment: .leading) {
                Text(recipe.ingredients[0].name)
                Text("\(recipe.price, specifier: "%.0f")원")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
