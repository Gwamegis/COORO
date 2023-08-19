//
//  RegisterRecipeView.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/20.
//

import SwiftUI

struct RegisterRecipeView: View {
    
    @State private var name: String = ""
    @State private var story: String = ""
    @State var menu: Menu
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                Image("FriedRice")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 135, height: 135)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.DarkGrey)
                    )
                    .padding(.top, 40)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("레시피 이름")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                    
                    TextField("", text: $name,
                              prompt: Text("레시피 이름을 지어주세요.").foregroundColor(.LightGrey)
                    )
                    .font(.system(size: 14))
                    
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("레시피 사연")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                    
                    TextField("", text: $story,
                              prompt: Text("레시피 사연을 작성해주세요.").foregroundColor(.LightGrey)
                    )
                    .font(.system(size: 14))
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("상세 레시피")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                    
                    VStack(alignment: .leading) {
                        
                        ForEach(Array(menu.recipe.produce.enumerated()), id: \.offset) { index, cook in
                            HStack(spacing: 0) {
                                Text("\(index + 1). ")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .bold))

                                getRecipeView(with: cook)
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10))
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.DarkGrey)
                    )
                }
                
                Spacer()
                
                Button {
                    menu.name = name
                    menu.story = story
                    menu.recipe.ingredients = getIngredients()
                    mockMenus.append(menu)
                } label: {
                    Text("등록하기")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                        .padding(.vertical, 18)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.Point)
                        )
                }
            }
            .padding(.horizontal, 20)
        }
        .background(Color.Background)
    }
    
    @ViewBuilder
    private func getRecipeView(with cook: Cook) -> some View {
        var ingredients: String = "치킨, 파"
        var time: String = "1m 30s"
        
        HStack(spacing: 8) {
            Text(ingredients)
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .bold))
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.Grey03)
                )
            
            Text("재료를")
                .foregroundColor(.LightGrey)
            
            Text(time)
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .bold))
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.Grey03)
                )
            
            Text("동안")
                .foregroundColor(.LightGrey)
            
            Text(cook.action.actionTitle)
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .bold))
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.Grey03)
                )
        }
    }
    
    private func getIngredients() -> [Ingredient] {
        var ingredientSet: Set<Ingredient> = []
        
        for produce in menu.recipe.produce {
            let set = produce.ingredients ?? []
            ingredientSet = ingredientSet.union(set)
        }
        
        return Array(ingredientSet)
    }
}

//struct RegisterRecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterRecipeView()
//    }
//}
