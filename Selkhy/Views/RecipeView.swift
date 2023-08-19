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
        story: "전남친만의 비밀 재료가 들어간 샌드위치!\n이것 대문에 다시 연락했어요.",
        recipe: Recipe(
            ingredients: [
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: true),
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
                Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
            ],
            amount: [3,6,2],
            price: 3500,
            produce: [Cook(action: CookAction.fry)]),
        review: Review(score: 10, photo: Image("sandwich") , content: ""),
        image: Image("Sandwich"))
    
    var body: some View {
        VStack {
            menu.image
                .resizable()
                .scaledToFit()
                .padding(.bottom, 53)
            VStack(spacing: 20) {
                Text(menu.name)
                    .font(.system(size: 20, weight: .bold))
                Text("\(numberFormatter(number:menu.recipe.price))원")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.Point)
                Text(menu.story)
                    .font(.system(size: 14, weight: .medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.LightGrey)
                HStack {
                    ForEach (menu.recipe.ingredients) { ingredient in
                        TagView(isHidden: ingredient.isHidden, text: ingredient.name)
                    }
                }
            }
            .foregroundColor(.white)
            
            Spacer()
            Button("쿠로에게 주문 요청하기") {
                //TODO: action
            }
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 19)
            .background(Color.Point)
            .cornerRadius(10)
            .padding(.horizontal, 20)
            .padding(.bottom, 60)
        }
        .frame(maxHeight: .infinity)
        .background(Color.black)
    }
    
    private func numberFormatter(number: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: number))!
    }
}

struct TagView: View {
    var isHidden: Bool
    let text: String
    var body: some View {
        HStack {
            if isHidden {
                Image("judy")
            }
            Text(text)
                .font(.system(size: 16, weight: .bold))
                .lineLimit(1)
        }
        .padding(10)
        .background(isHidden ? Color.Purple : Color.Green)
        .cornerRadius(10)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RecipeView()
        }
        
    }
}
