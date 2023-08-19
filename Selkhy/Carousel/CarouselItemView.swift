//
//  CarouselItemView.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/20.
//

import SwiftUI

struct CarouselItemView: View {
    private let buttonTitle = ["재료", "조리", "시간"]
    var index: Int
    let item: Cook
    @Binding var isShowIngredientSelection: Bool
    @Binding var isShowCookActionSelection: Bool
    @Binding var isShowTimeSelection: Bool
    //    @Binding var selectedAction: CookAction?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
            
            VStack(spacing: 24) {
                Text("STEP \(index)")
                    .font(Font.Cooro.CarouselFont)
                    .padding(.top, 30)
                
                HStack(spacing: 18) {
                    
                    VStack(spacing: 26) {
                        Button {
                            self.isShowIngredientSelection.toggle()
                        } label: {
                            if item.ingredients?.count ?? 0 >= 1 {
                                Image("paperBag")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                // .offset(y: 20)
                            } else {
                                VStack(spacing: 26) {
                                    Image("SelectButton")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 70, height: 70)
                                }
                            }
                        }
                        
                        if item.ingredients?.count ?? 0 >= 1 {
                            VStack(spacing: 26) {
                                Text("\(item.ingredients?.count ?? 0)개")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black).opacity(0.4)
                            }
                        } else {
                            Text("재료")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black).opacity(0.4)
                        }
                        
                    }
                    
                    VStack(spacing: 26) {
                        Button {
                            isShowCookActionSelection.toggle()
                        } label: {
                            VStack(spacing: 26) {
                                Image("SelectButton")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 70, height: 70)
                            }
                        }
                        
                        Text(item.action?.actionTitle ?? "")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black).opacity(0.4)
                        
                    }
                    
                    VStack(spacing: 26) {
                        Button {
                            isShowTimeSelection.toggle()
                        } label: {
                            VStack(spacing: 26) {
                                Image("SelectButton")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 70, height: 70)
                            }
                        }
                        
                        Text("시간")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black).opacity(0.4)
                        
                    }
                }
                .padding(.bottom, 28)
                .padding(.horizontal, 20)
            }
        }
        .frame(width: 290, height: 208)
    }
}

struct EmptyCarouselItemView: View {
    
    @State var phase: CGFloat = 0
    var index: Int
    
    var body: some View {
        ZStack {
            Color.Background
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(
                    style: StrokeStyle(
                        lineWidth: 5,
                        dash: [10],
                        dashPhase: phase)
                )
                .foregroundColor(.LightGrey)
            
            VStack {
                Text("STEP \(index)")
                    .padding(.top, 30)
                    .foregroundColor(.LightGrey)
                    .font(Font.Cooro.CarouselFont)
                
                Spacer()
                Image(systemName: "plus")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.LightGrey)
                
                Spacer()
            }
            
        }
        .frame(width: 290, height: 208)
    }
}

//struct CarouselItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarouselItemView(item: "hello", isShowIngredientSelection: .constant(false), isShowCookActionSelection: .constant(false), isShowTimeSelection: .constant(false))
////        EmptyCarouselItemView()
//    }
//}
