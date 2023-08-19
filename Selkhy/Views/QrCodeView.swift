//
//  QrCodeView.swift
//  Selkhy
//
//  Created by 이지원 on 2023/08/19.
//

import SwiftUI

struct QrCodeView: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.6)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        isPresented.toggle()
                    }
                }
            
            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    
                    Button {
                        withAnimation {
                            isPresented.toggle()
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                    }
                }
                .padding([.horizontal, .top], 30)
                
                Image("QrCode")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 40)
                
                Text("픽업 QR")
                    .font(.system(size: 20, weight: .bold))
                
                Text("주문번호 9208")
                    .font(.system(size: 16))
                    .foregroundColor(.DarkGrey)
                    .padding(.bottom, 45)
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
            )
            .padding(.horizontal, 50)
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct QrCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QrCodeView(isPresented: .constant(true))
    }
}
