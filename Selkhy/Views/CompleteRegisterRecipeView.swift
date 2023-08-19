//
//  CompleteCreateRecipeView.swift
//  Selkhy
//
//  Created by JeonJimin on 2023/08/20.
//

import SwiftUI

struct CompleteRegisterRecipeView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    @State private var isAnimating = false
    var body: some View {
        ZStack(alignment: .top) {
            Color.Background.ignoresSafeArea()
            
            HStack(spacing: 0){
                Button {
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.clear)
                }
                Spacer()
                Text("레시피 등록 완료")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                Spacer()
                Button {
                    withAnimation {
                        NavigationUtil.popToRootView()
                        dismiss()
                    }
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 20)
            
            Image("completeBg")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
                .opacity(isAnimating ? 0.5 : 1.0)
                .animation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true))
            
            VStack(spacing: 60) {
                Spacer()
                Image("Sandwich")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 285)
                    .offset(y: isAnimating ? 0 : -10)
                    .scaleEffect(isAnimating ? 1.1 : 1.0)
                    .animation(Animation.interpolatingSpring(stiffness: 150, damping: 5).repeatForever(autoreverses: true))
                
                Text("\(name)\n생성 완료!")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.Point)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
            }
            .padding(.bottom, 130)
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            self.isAnimating = true
        }
    }
}
