//
//  HomeView.swift
//  Selkhy
//  
//  Created by Kyubo Shim on 2023/08/19.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var menuStore: MenuStore
    var body: some View {
        NavigationView {
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
                            
                            NavigationLink {
                                CreateRecipeView()
                            } label: {
                                Text("레시피 등록")
                                    .padding(10)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.white)
                                    .background(Color("Point"))
                                    .cornerRadius(10)
                            }
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
                                ForEach(Array(menuStore.mockMenus.prefix(5)).indices, id: \.self) { index in
                                    NavigationLink {
                                        RecipeView(menu: menuStore.mockMenus[index])
                                    } label: {
                                        MenuCell(menu: menuStore.mockMenus[index])
                                    }
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
                            ForEach(Array(menuStore.mockMenus.dropFirst(5)).indices, id: \.self) { index in
                                let adjustedIndex = index + 5
                                NavigationLink(destination: RecipeVoteView(menu: menuStore.mockMenus[adjustedIndex])) {
                                    RankingCell(rank: adjustedIndex - 4, menu: menuStore.mockMenus[adjustedIndex])
                                }
                            }
                        }
                        .padding(.top, 10)
                        
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

extension UINavigationController: ObservableObject, UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(MenuStore())
    }
}
