//
//  HomeView.swift
//  Selkhy
//
//  Created by Kyubo Shim on 2023/08/19.
//

import SwiftUI

struct HomeView: View {
    let menus = mockMenus
    var body: some View {
        NavigationStack {
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
                            
                            Button(action: {
                                // TODO: 버튼 클릭시 레시피 등록창 이동
                                print("register recipe")
                            }, label: {
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
                            Text("이번주 요리")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color("LightGrey"))
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(menus.indices, id: \.self) { index in
                                    MenuCell(menu: menus[index])
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
                                NavigationLink(destination: RecipeVoteView(menu: menus[index])) {
                                    RankingCell(rank: index + 1, menu: menus[index])
                                }
                            }
                        }
                        .padding(.top, 10)
                        
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
