//
//  MenuCell.swift
//  Selkhy
//
//  Created by Kyubo Shim on 2023/08/19.
//

import SwiftUI

struct MenuCell: View {
    var menu: Menu

    var body: some View {
        ZStack {
            Color("DarkGrey")
            VStack {
                menu.image
                    .resizable()
                    .frame(width: 280, height: 200)
                VStack(alignment: .leading) {
                    HStack {
                        Text(menu.name)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text("\(menu.recipe.price, specifier: "%.0f")원")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color("Point"))
                    }
                    .padding(.bottom, 16)
                    Text(menu.story)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 20)
            }
        }
        .frame(width: 320, height: 320)
        .cornerRadius(10)
    }
}


struct MenuCell_Previews: PreviewProvider {
    static var previews: some View {
        MenuCell(menu: Menu(
            name: "전남친 샌드위치",
            numberOfOrder: 10,
            story: "전남친만의 비밀 재료가 들어간 샌드위치!\n이것 때문에 다시 연락했어요.",
            recipe: Recipe(
                ingredients: [
                    Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: true),
                    Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
                    Ingredient(name: "토마토", image: Image("Sandwich"), isHidden: false),
                ],
                amount: [3,6,2],
                price: 3500 ),
            review: [Review(score: 10, content: "")],
            image: Image("Sandwich")))
    }
}
