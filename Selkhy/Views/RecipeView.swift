//
//  RecipeView.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/19.
//

import SwiftUI


struct RecipeView: View {
    var menu = Menu(
        name: "전남친 샌드위치",
        numberOfOrder: 10,
        story: "전남친만의 비밀 재료가 들어간 샌드위치! 이것 대문에 다시 연락했어요.",
        recipe: Recipe(
            ingredients: [Food(name: "토마토", image: Image("sandwitch1"))],
            amount: [3,6,2],
            price: 3500,
            produce: [Cook(action: CookAction.fry)]),
        review: Review(score: 10, photo: Image("sandwitch1") , content: ""),
        image: Image("sandwitch1"))
    
    var body: some View {
        VStack {
            menu.image
                .resizable()
                .scaledToFit()
            
            VStack(spacing: 20) {
                Text(menu.name)
                    .font(.system(size: 20, weight: .bold))
                Text(String(menu.recipe.price))
                    .font(.system(size: 20, weight: .bold))
                Text(menu.story)
                    .font(.system(size: 14, weight: .medium))
                
            }
            .foregroundColor(.white)
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
