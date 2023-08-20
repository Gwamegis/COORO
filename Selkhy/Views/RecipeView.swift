//
//  RecipeView.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/19.
//

import SwiftUI


struct RecipeView: View {
    var menu: Menu
    
    var body: some View {
        ScrollView {
            VStack {
                menu.image
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, 53)
                
                VStack(spacing: 20) {
                    Text(menu.name)
                        .font(.system(size: 20, weight: .bold))
                    Text(menu.recipe.price.numberFormatter())
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.Point)
                    Text(menu.story)
                        .font(.system(size: 14, weight: .medium))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.LightGrey)
                    HStack {
                        FlexibleView(data: menu.recipe.ingredients, isInOrder: false)
                    }
                }
                .foregroundColor(.white)
                .padding(.bottom, 30)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("리뷰 \(menu.review?.count ?? 0)")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.Grey10)
                    
                    if let review = menu.review {
                        ForEach(Array(review.enumerated()).prefix(2), id: \.offset) { index, review in
                            ReviewView(review: review )
                        }
                    }
                    Button {
                        //TODO
                    } label: {
                        HStack {
                            Text("리뷰 더보기")
                            Image(systemName: "chevron.down")
                        }
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 10)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
                NavigationLink {
                    OrderView(menu: menu)
                } label: {
                    Text("쿠로에게 주문 요청하기")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 19)
                        .background(Color.Point)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 44)
            }
        }
        .background(Color.Background)
        .scrollIndicators(.hidden)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
    }
}

struct TagView: View {
    var isHidden: Bool
    let text: String
    @State var width: CGFloat = 0
    
    var body: some View {
        HStack {
            if isHidden {
                Image("judy")
            }
            Text(isHidden ? "히든 재료" : text)
                .font(.system(size: 16, weight: .bold))
                .lineLimit(1)
        }
        .foregroundColor(.white)
        .padding(10)
        .background(isHidden ? Color.Purple : Color.Green)
        .cornerRadius(10)
    }
}
