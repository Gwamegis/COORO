//
//  RegisterRecipeView.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/20.
//

import SwiftUI

struct RegisterRecipeView: View {
    @EnvironmentObject var menuStore: MenuStore
    @State private var name: String = ""
    @State private var story: String = ""
    @State var menu: Menu?
    @State var isCompleted: Bool = false
    
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
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.Grey03)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("레시피 사연")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                    
                    TextField("", text: $story,
                              prompt: Text("레시피 사연을 작성해주세요.").foregroundColor(.LightGrey)
                    )
                    .font(.system(size: 14))
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.Grey03)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("상세 레시피")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                    
                    VStack(alignment: .leading) {
                        if let menu {
                            ForEach(Array(menu.recipe.produce.enumerated()), id: \.offset) { index, cook in
                                HStack(spacing: 0) {
                                    Text("\(index + 1). ")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .bold))
                                        .padding(.leading, 10)
                                    getRecipeView(with: cook)
                                }
                                .frame(width: UIScreen.main.bounds.size.width - 60, alignment: .leading)
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
                
                NavigationLink {
                    CompleteRegisterRecipeView(name: name)
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
                .simultaneousGesture(TapGesture().onEnded{
                    if var menu {
                        menu.name = name
                        menu.story = story
                        menu.recipe.ingredients = getIngredients()
                        isCompleted.toggle()
                        menu.image = Image("FriedRice")
                        menuStore.mockMenus.append(menu)
                        // mockMenus.append(menu)
                    }
                })
            }
            .padding(.horizontal, 20)
        }
        .background(Color.Background)
        .navigationBarBackButtonHidden()
        .navigationTitle("레시피 등록")
    }
    
    @ViewBuilder
    private func getRecipeView(with cook: Cook) -> some View {
        var time: String = "1m 30s"
        
        HStack(spacing: 8) {
            if let ingredients = cook.ingredients {
                
                Text(ingredients.map { $0.name }.joined(separator: ", "))
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.Grey03)
                    )
                
                Text("재료를")
                    .foregroundColor(.LightGrey)
                    .font(.system(size: 14))
            }
            Text(time)
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .bold))
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.Grey03)
                )
            
            Text("동안")
                .foregroundColor(.LightGrey)
                .font(.system(size: 14))
            
            if let actionTitel = cook.action?.actionTitle {
                Text(actionTitel)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.Grey03)
                    )
            }
        }
    }
    
    private func getIngredients() -> [Ingredient] {
        var ingredientSet: Set<Ingredient> = []
        
        guard let menu else { return [] }
        for produce in menu.recipe.produce {
            let set = produce.ingredients ?? []
            ingredientSet = ingredientSet.union(set)
        }
        
        return Array(ingredientSet)
    }
}

struct RegisterRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterRecipeView(menu:
                            Menu(
                                name: "3분 스시 김밥",
                                numberOfOrder: 10,
                                creater: "오마카세아니면밥상엎음",
                                likes: 200,
                                story: "전남친만의 비밀 재료가 들어간 샌드위치!\n이것 대문에 다시 연락했어요.",
                                recipe: Recipe(
                                    ingredients: [
                                        Ingredient(name: "단무지", image: Image("PickledRadish"), isHidden: false),
                                        Ingredient(name: "햄", image: Image("Ham"), isHidden: false),
                                        Ingredient(name: "스시밥", image: Image("SushiRice"), isHidden: false)
                                    ],
                                    amount: [3,3,6],
                                    price: 5000,
                                    produce: [
                                        Cook(ingredients: [Ingredient(name: "단무지", image: Image("PickledRadish"), isHidden: false), Ingredient(name: "햄", image: Image("Ham"), isHidden: false)], action: .fry, time: "3m 20s"),
                                        Cook(ingredients: [Ingredient(name: "햄", image: Image("Ham"), isHidden: false)], action: .fry, time: "4m 20s"),
                                        Cook(ingredients: [Ingredient(name: "스시밥", image: Image("SushiRice"), isHidden: false)], action: .boil, time: "5m 20s")
                                    ]
                                ),
                                review: [Review(score: 10, photo: Image("Sandwich") , content: "")],
                                image: Image("Kimbob")))
    }
}
