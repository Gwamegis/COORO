//
//  OrderCompleteView.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/19.
//

import SwiftUI

struct OrderCompleteView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var isPresentQrCodeView = false
    @State private var numberOfShakes: CGFloat = 0
    private let deviceWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            VStack(spacing: 25) {
                ZStack {
                    Text("주문 완료")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                    
                    HStack {
                        Spacer()
                        Button {
                            NavigationUtil.popToRootView()
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .bold))
                                .padding(.trailing, 20)
                        }
                    }
                }
                .frame(width: deviceWidth)
                .padding(.top, 20)
                
                Spacer()
                
                Image("CookingProcess")
                    .resizable()
                    .scaledToFill()
                    .frame(maxHeight: 270)
                    .padding(.leading, 100)
                    .modifier(ShakeEffect(delta: numberOfShakes))
                
                Text("비밀 소스 만드는 중 ...")
                    .foregroundColor(.Point)
                    .font(.system(size: 16, weight: .bold))
                
                Button {
                    
                } label: {
                    ZStack {
                        Text("실시간 조리과정 구경하기")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.Point)
                            )
                    }
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        withAnimation {
                            isPresentQrCodeView.toggle()
                        }
                    } label: {
                        Image("QrButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .padding(.trailing, 20)
                    }
                }
                .frame(width: deviceWidth)
            }
            .background(Color.Background)
            
            if isPresentQrCodeView {
                QrCodeView(isPresented: $isPresentQrCodeView)
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 10).repeatForever()) {
                if numberOfShakes == 0 {
                    numberOfShakes = 14
                }else {
                    numberOfShakes = 0
                }
            }
            
        }
    }
}

struct OrderCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCompleteView()
    }
}
