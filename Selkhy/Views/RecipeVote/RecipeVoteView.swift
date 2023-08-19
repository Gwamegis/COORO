//
//  RankingDetailView.swift
//  Selkhy
//
//  Created by Kyubo Shim on 2023/08/19.
//

import SwiftUI

struct RecipeVoteView: View {
    var menu: Menu
    @State var isClicked: Bool = false
    
    var body: some View {
        ZStack{
            Color.Background
                .ignoresSafeArea()
            VStack {
                menu.image
                    .resizable()
                    .frame(width: 280, height: 200)
                    .padding()
                
                HStack {
                    Image("Avatar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                    
                    Text(menu.creater)
                        .font(.system(size: 14))
                        .foregroundColor(Color.LightGrey)
                }
                
                Text(menu.name)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.vertical, 15)
                
                
                Text("\(menu.likes)명 기대중")
                    .font(.system(size: 16))
                    .foregroundColor(Color.Point)
                    .padding(.bottom, 20)
                
                Text(menu.story)
                    .font(.system(size: 14))
                    .foregroundColor(Color.LightGrey)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                
                HStack {
                    ForEach(menu.recipe.ingredients.indices, id: \.self) { index in
                        ZStack{
                            Text(menu.recipe.ingredients[index].name)
                                .font(.system(size: 16, weight: .bold))
                                .padding(10)
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.bottom, 80)
                
                Button(action: {
                    self.isClicked.toggle()
                }, label: {
                    ZStack{
                        if isClicked{
                            Color.DarkGrey
                        } else {
                            Color.Point
                        }
                        
                        HStack{
                            if isClicked{
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15)
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                            Text("먹어보고 싶어요")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                    .cornerRadius(10)
                    .frame(height: 60)
                    .padding(.horizontal)
                    
                })

            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
    }
}

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
        }
    }
}


struct RankingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeVoteView(menu:
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
                                review: [Review(score: 10, photo: Image("sandwich") , content: "")],
                                image: Image("Sandwich")))
    }
}
