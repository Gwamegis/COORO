//
//  OrderView.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/19.
//

import SwiftUI

struct OrderView: View {
    
    var menu: Menu
    @State private var isPresented = false
    @State private var ingredients: [Ingredient] = []
    private let toastMessageText: Text = {
        var t = Text("로봇팔이 조리해서 ")
            .foregroundColor(.white)
        t = t + Text("5,000원 ")
            .foregroundColor(Color("Point"))
        t = t + Text("절약했어요!")
            .foregroundColor(.white)
        return t
    }()
    
    var body: some View {
        // MARK: - 포장 뷰
        VStack(alignment: .leading, spacing: 30) {
            VStack(alignment: .leading, spacing: 24) {
                HStack {
                    Text("포장 \(Image(systemName: "chevron.down"))")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.Point)
                        )
                    Text("할게요")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("쿠로 동백점")
                            .foregroundColor(.white)
                        HStack {
                            Text("동백 8로 27")
                                .foregroundColor(.white)
                                .font(.system(size: 10))
                            Text("200m")
                                .foregroundColor(.Point)
                                .font(.system(size: 12, weight: .bold))
                        }
                    }
                    
                    Spacer()
                    
                    Text("매장 선택")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .bold))
                        .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.LightGrey)
                        )
                }
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.DarkGrey)
            )
            .padding(.top, 30)
            
            // MARK: - 재료 커스터마이즈
            VStack(alignment: .leading) {
                Text("재료 커스터마이즈")
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                
                FlexibleView(data: ingredients, isInOrder: true)
            }
            
            HStack {
                Text("주문 금액")
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                
                Spacer()
                
                Text(menu.recipe.price.numberFormatter())
                    .foregroundColor(.white)
                    .font(.system(size: 14))
            }
            
            // MARK: - 결제 수단
            HStack {
                Text("결제 수단")
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                
                Spacer()
                
                HStack {
                    Text("국민카드 390")
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                    Image(systemName: "chevron.right")
                        .foregroundColor(.Point)
                        .font(.system(size: 14, weight: .bold))
                }
            }
            
            Spacer()
            
            VStack {
                toastMessageText
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.DarkGrey)
                    )
            }
            
            .frame(maxWidth: .infinity)
            
            // MARK: - 결제 버튼
            Button {
                isPresented.toggle()
            } label: {
                Text("\(menu.recipe.price.numberFormatter()) 결제하기")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .bold))
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.Point)
                    )
            }
            .padding(.bottom, 25)
            .fullScreenCover(isPresented: $isPresented) {
                OrderCompleteView()
            }
        }
        .padding(.horizontal, 16)
        .background(Color.Background)
        .onAppear {
            ingredients = menu.recipe.ingredients
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
    }
}

struct IngredientTagView: View {
    var title: String
    @State var isSelected: Bool = true
    
    var body: some View {
        ZStack {
            Text("\(title) \(Image(systemName: isSelected ? "xmark" : "plus"))")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .padding(10)
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(isSelected ? Color.Green : Color.DarkGrey)
        )
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(menu: Menu(
            name: "전남친 샌드위치",
            numberOfOrder: 10,
            creater: "스윗쿡남",
            likes: 300,
            story: "전남친만의 비밀 재료가 들어간 샌드위치!\n이것 대문에 다시 연락했어요.",
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
