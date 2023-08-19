//
//  RankingView.swift
//  Selkhy
//
//  Created by Kyubo Shim on 2023/08/19.
//

import SwiftUI

struct RankingView: View {
    let menus = mockMenus
    var body: some View {
        ZStack{
            Color("Background")
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {
                    HStack{
                        Image("AppLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Text("레시피 등록")
                                .padding(10)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                                .background(Color("Point"))
                                .cornerRadius(10)
                                
                        })
                    }
                    .padding(.bottom, 30)
                    
                    HStack{
                        Image("Crown")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                        Text("이번주의 요리")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color("LightGrey"))
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(menus.indices, id: \.self) { index in
                                ZStack {
                                    Color("DarkGrey")
                                    VStack {
                                        menus[index].image
                                            .resizable()
                                            .frame(width: 280, height: 200)
                                        VStack(alignment: .leading) {
                                            HStack {
                                                Text(menus[index].name)
                                                    .font(.system(size: 18, weight: .bold))
                                                    .foregroundColor(.white)
                                                
                                                Spacer()
                                                
                                                Text("\(menus[index].recipe.price, specifier: "%.0f")원")
                                                    .font(.system(size: 18, weight: .bold))
                                                    .foregroundColor(Color("Point"))
                                            }
                                            .padding(.bottom, 16)
                                            Text(menus[index].story)
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
                    }
                    .padding(.bottom, 30)
                    HStack{
                        Image("Face")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                        Text("이번주 랭킹")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color("LightGrey"))
                    }
                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(menus.indices, id: \.self) { index in
                            RankingCell(rank: index + 1, menu: menus[index])
                        }
                    }
                    .padding(.top, 10)
                    
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView()
    }
}


//struct RankingCell: View {
//    var rank: Int
//    var menu: Menu
//    
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 10)  // 네모난 셀 배경 추가
//                .fill(Color("DarkGrey"))  // 배경색 설정
//                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)  // 그림자 추가
//            
//            HStack {
//                Text("\(rank).")
//                    .font(.system(size: 20, weight: .bold))
//                    .foregroundColor(Color("Point"))
//                
//                menu.image
//                    .resizable()
//                    .frame(width: 90, height: 70)
//                
//                VStack(alignment: .leading) {
//                    Text(menu.name)
//                        .font(.system(size: 16, weight: .bold))
//                        .foregroundColor(.white)
//                    Text("\(menu.recipe.price, specifier: "%.0f")원")
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                }
//                Spacer()
//            }
//            .padding()  // 셀 내부에 패딩 추가
//        }
//        .frame(height: 100)  // 셀 높이 설정
//    }
//}
