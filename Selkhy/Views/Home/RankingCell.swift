//
//  RankingCell.swift
//  Selkhy
//
//  Created by Kyubo Shim on 2023/08/19.
//

import SwiftUI

struct RankingCell: View {
    var rank: Int
    var menu: Menu
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)  // 네모난 셀 배경 추가
                .fill(Color("DarkGrey"))  // 배경색 설정
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)  // 그림자 추가
            
            HStack {
                Text("\(rank).")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color("Point"))
                
                menu.image
                    .resizable()
                    .frame(width: 90, height: 70)
                
                VStack(alignment: .leading) {
                    Text(menu.name)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                    Text("\(menu.recipe.price, specifier: "%.0f")원")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()  // 셀 내부에 패딩 추가
        }
        .frame(height: 100)  // 셀 높이 설정
    }
}
struct RankingCell_Previews: PreviewProvider {
    static var previews: some View {
        RankingCell(rank: 1, menu:
            Menu(
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
            review: Review(score: 10, photo: Image("sandwich") , content: ""),
            image: Image("Sandwich")))
    }
}
