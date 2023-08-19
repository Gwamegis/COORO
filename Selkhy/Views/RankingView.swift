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
                    HStack {
                        ForEach(menus.indices, id: \.self) { index in
                            ZStack {
                                Color.red
                                VStack {
                                    menus[index].image
                                        .resizable()
                                        .frame(width: 280, height: 200)
                                    VStack {
                                        HStack {
                                            Text(menus[index].name)
                                            Text("\(menus[index].recipe.price, specifier: "%.0f")원")
                                        }
                                        Text(menus[index].story)  // 메뉴의 story 사용
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
                    ForEach(1 ..< menus.count) { index in
                        RankingCell(rank: index + 1, menu: menus[index])
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
    var menu: Menu

    var body: some View {
        HStack {
            Text("\(rank)")
                .font(.headline)
            
            menu.image
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
