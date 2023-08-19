//
//  OrderView.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/19.
//

import SwiftUI

struct OrderView: View {
    
    var ingredients: [Food] = []
    
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
        ZStack {
            Color(UIColor(named: "Background")!)
                .ignoresSafeArea()
            
            // MARK: - 포장 뷰
            VStack(alignment: .leading, spacing: 30) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("포장 \(Image(systemName: "chevron.down"))")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color(UIColor(named: "Point")!))
                            )
                        Text("할게요")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    
                    HStack {
                        VStack {
                            Text("쿠로 동백점")
                                .foregroundColor(.white)
                            HStack {
                                Text("동백 8로 27")
                                    .foregroundColor(.white)
                                    .font(.system(size: 10))
                                Text("200m")
                                    .foregroundColor(Color(UIColor(named: "Point")!))
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
                                    .foregroundColor(Color("LightGrey"))
                            )
                    }
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(UIColor(named: "DarkGrey")!))
                )
                
                // MARK: - 재료 커스터마이즈
                VStack(alignment: .leading) {
                    Text("재료 커스터마이즈")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                }
                
                HStack {
                    Text("주문 금액")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                    
                    Spacer()
                    
                    Text("3500원")
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
                            .foregroundColor(Color("Point"))
                            .font(.system(size: 14, weight: .bold))
                    }
                }
                
                Spacer()
                
                VStack {
                    toastMessageText
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color("DarkGrey"))
                        )
                }
                
                .frame(maxWidth: .infinity)
                
                // MARK: - 결제 버튼
                Button {
                    
                } label: {
                    Text("3,500원 결제하기")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                        .padding(20)
                        .frame(maxWidth: .infinity)
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color("Point"))
                )
                
                
            }
            .padding(.horizontal, 16)
        }
        
    }
    @ViewBuilder
    private func getIngredientTagView(with food: Food, isSelected: Bool) -> some View {
        var isSelected = isSelected
        ZStack {
            Text("\(food.name) \(Image(systemName: "xmark"))")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .padding(10)
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(isSelected ? Color("Green") : Color("DarkGrey"))
        )
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
