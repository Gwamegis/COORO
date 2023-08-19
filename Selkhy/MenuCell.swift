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
                        
                        Text("\(menu.recipe.price)원")
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
            creater: "스윗쿡남",
            likes: 300,
            story: "전남친만의 비밀 재료가 들어간 샌드위치!\n이것 때문에 다시 연락했어요.",
            recipe: Recipe(
                ingredients: [
                    Ingredient(name: "빵", image: Image("Bread"), isHidden: false),
                    Ingredient(name: "블루베리잼", image: Image("Jam"), isHidden: false),
                ],
                amount: [2, 1],  // 2개의 빵과 1개의 블루베리잼을 사용한다고 가정
                price: 3500,
                produce: [
                    Cook(ingredients: [Ingredient(name: "빵", image: Image("Bread"), isHidden: false),
                                       Ingredient(name: "블루베리잼", image: Image("Jam"), isHidden: true)],
                         action: .fry, time: "1m"
                        )
                ]
            ),
            review: [Review(score: 10, photo: Image("Sandwich"), content: "직접 픽업해서 먹었는데, 1위인 이유가 있네요."), Review(score: 10, content: "직접 픽업해서 먹었는데, 1위인 이유가 있네요.")],
            image: Image("Sandwich")))
    }
}
