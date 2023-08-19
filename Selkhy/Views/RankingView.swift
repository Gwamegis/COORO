//
//  RankingView.swift
//  Selkhy
//
//  Created by Kyubo Shim on 2023/08/19.
//

import SwiftUI

struct RankingView: View {
    let recipes: [Recipe] = [
            Recipe(ingredients: [Food(name: "피자", image: UIImage(named: "pizzaImage")!)], amount: [1], price: 10000),
            Recipe(ingredients: [Food(name: "파스타", image: UIImage(named: "pizzaImage")!)], amount: [2], price: 12000),
            Recipe(ingredients: [Food(name: "떡볶이", image: UIImage(named: "pizzaImage")!)], amount: [3], price: 7000),
            Recipe(ingredients: [Food(name: "김밥", image: UIImage(named: "pizzaImage")!)], amount: [1], price: 5000),
            Recipe(ingredients: [Food(name: "라멘", image: UIImage(named: "pizzaImage")!)], amount: [1], price: 9000)
        ]

        var body: some View {
            VStack{
                Text("쿠로 마스코트")
                HStack{
                    Text("이번주 쿠로 랭킹")
                    Spacer()
                }
                ZStack{
                    Color.red
                    VStack{
                    Image(uiImage: UIImage(named: "pizzaImage")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                        VStack{
                            HStack{
                                Text(recipes[0].ingredients[0].name)
                                Text("\(recipes[0].price, specifier: "%.0f")원")
                            }
                            Text("설명 솰라솰라")
                        }
                    }
                }
                .cornerRadius(30)
                List {
                    ForEach(1 ..< recipes.count) { index in
                        RankingCell(rank: index + 1, recipe: recipes[index])
                    }
                }
                .listStyle(.plain)
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
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(recipe.ingredients[0].name)
                Text("\(recipe.price, specifier: "%.0f")원")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
