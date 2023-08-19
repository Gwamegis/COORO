//
//  CarouselItemView.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/20.
//

import SwiftUI

struct CarouselItemView: View {
    private let buttonTitle = ["재료", "조리", "시간"]
    let index: Int = 1
    let item: String
    @Binding var isShowIngredientSelection: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
            
            VStack(spacing: 24) {
                Text("STEP \(index + 1)")
                    .padding(.top, 30)
                
                HStack(spacing: 18) {
                    
                    VStack(spacing: 26) {
                        Button {
                            // TODO: navigatino link = 재료
                            self.isShowIngredientSelection.toggle()
                        } label: {
                            VStack(spacing: 26) {
                                Image("SelectButton")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 70, height: 70)
                            }
                        }
                        
                        Text("재료")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black).opacity(0.4)
                        
                    }
                    
                    VStack(spacing: 26) {
                        Button {
                            // TODO: navigatino link = 조리
                        } label: {
                            VStack(spacing: 26) {
                                Image("SelectButton")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 70, height: 70)
                            }
                        }
                        
                        Text("조리")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black).opacity(0.4)
                        
                    }
                    
                    VStack(spacing: 26) {
                        Button {
                            // TODO: navigatino link = 시간
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
                Text("STEP 2")
                    .padding(.top, 30)
                    .foregroundColor(.LightGrey)
                
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

struct CarouselItemView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselItemView(item: "hello", isShowIngredientSelection: .constant(false))
//        EmptyCarouselItemView()
    }
}
