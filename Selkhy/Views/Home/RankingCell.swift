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
                        .padding(.bottom, 5)
                    Text("\(menu.likes)명 기대중")
                        .font(.system(size: 12))
                        .foregroundColor(Color.Point)
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
            creater: "스윗쿡남",
            likes: 300,
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
